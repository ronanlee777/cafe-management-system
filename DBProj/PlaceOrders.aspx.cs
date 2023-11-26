using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace DBProj
{
    public partial class PlaceOrders : System.Web.UI.Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] == null)
                {
                    Response.Redirect("LoginPage.aspx");
                    return;
                }

                LoadMenuItems();
            }
            else
            {
                // Update the total from the hidden field on postbacks
                decimal totalBill = Convert.ToDecimal(hiddenTotal.Value);
                lblTotal.Text = $"Total: {totalBill:C}";
            }
        }

        private void LoadMenuItems()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT ItemId, Name, Description, Price FROM MenuItems";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                // Create a DataTable to hold the menu items
                DataTable dt = new DataTable();
                dt.Load(reader);

                // Remove the dollar sign from the Price column
                dt.Columns["Price"].DataType = typeof(decimal);
                foreach (DataRow row in dt.Rows)
                {
                    row["Price"] = StripCurrencyFormat(row["Price"].ToString());

                }

                // Bind the DataTable to the GridView
                GridViewMenuItems.DataSource = dt;
                GridViewMenuItems.DataBind();
            }
        }

        protected void GridViewMenuItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridViewMenuItems.Rows[index];

            // Extract price and remove any currency formatting
            string priceText = row.Cells[2].Text;
            decimal price = Convert.ToDecimal(StripCurrencyFormat(priceText));

            TextBox txtQuantity = (TextBox)row.FindControl("txtQuantity");
            int quantity = int.Parse(txtQuantity.Text);

            decimal totalBill = Convert.ToDecimal(hiddenTotal.Value);

            if (e.CommandName == "AddToOrder")
            {
                totalBill += price * quantity;
            }
            else if (e.CommandName == "RemoveFromOrder")
            {
                totalBill -= price * quantity;
                totalBill = Math.Max(totalBill, 0); // Prevent negative total
            }

            // Update the hidden field and label
            hiddenTotal.Value = totalBill.ToString();
            lblTotal.Text = $"Total: {totalBill:C}";
        }

        private string StripCurrencyFormat(string text)
        {
            var filtered = text.Where(c => char.IsDigit(c) || c == '.').ToArray();
            return new string(filtered);
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            int userId = GetUserId();
            if (userId == -1)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            decimal totalAmount = Convert.ToDecimal(hiddenTotal.Value);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                try
                {
                    // Insert into Orders table
                    string orderQuery = "INSERT INTO Orders (UserId, OrderDate, TotalAmount) OUTPUT INSERTED.OrderId VALUES (@UserId, @OrderDate, @TotalAmount)";
                    SqlCommand orderCmd = new SqlCommand(orderQuery, conn);
                    orderCmd.Parameters.AddWithValue("@UserId", userId);
                    orderCmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                    orderCmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                    int orderId = (int)orderCmd.ExecuteScalar();

                    // Insert into OrderDetails table
                    foreach (GridViewRow row in GridViewMenuItems.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            HiddenField hiddenItemId = row.FindControl("HiddenItemId") as HiddenField;
                            TextBox txtQuantity = row.FindControl("txtQuantity") as TextBox;

                            if (hiddenItemId != null && txtQuantity != null && int.TryParse(txtQuantity.Text, out int quantity) && quantity > 0)
                            {
                                int itemId = Convert.ToInt32(hiddenItemId.Value);
                                string priceText = row.Cells[2].Text;
                                decimal price = Convert.ToDecimal(StripCurrencyFormat(priceText));

                                string detailsQuery = "INSERT INTO OrderDetails (OrderId, ItemId, Quantity, Price) VALUES (@OrderId, @ItemId, @Quantity, @Price)";
                                SqlCommand detailsCmd = new SqlCommand(detailsQuery, conn);
                                detailsCmd.Parameters.AddWithValue("@OrderId", orderId);
                                detailsCmd.Parameters.AddWithValue("@ItemId", itemId);
                                detailsCmd.Parameters.AddWithValue("@Quantity", quantity);
                                detailsCmd.Parameters.AddWithValue("@Price", price);
                                detailsCmd.ExecuteNonQuery();
                            }
                        }
                    }

                    Session["CurrentOrderId"] = orderId;
                    Response.Redirect("OrderCheckout.aspx");
                }


                catch (Exception ex)
                {
                    // Detailed error logging
                    string errorMessage = $"Error in processing your order: {ex.Message}";
                    if (ex.InnerException != null)
                    {
                        errorMessage += $" Inner Exception: {ex.InnerException.Message}";
                    }

                    // Log the error (adjust with your logging mechanism)
                    // Log.Error(errorMessage, ex);

                    // Inform the user
                    Response.Write(errorMessage);
                }

            }
        }

        private int GetUserId()
        {
            if (Session["UserId"] != null)
            {
                return Convert.ToInt32(Session["UserId"]);
            }
            else
            {
                // Handle the case where the user is not logged in or the session has expired
                return -1; // You might want to redirect to the login page here
            }
        }

    }
}
