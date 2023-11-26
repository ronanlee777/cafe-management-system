using System;
using System.Data.SqlClient;
using System.Data;
using System.Linq;

namespace DBProj
{
    public partial class OrderCheckout : System.Web.UI.Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrderDetails();
                LoadUsername();
            }
        }

        private void LoadOrderDetails()
        {
            int orderId = Convert.ToInt32(Session["CurrentOrderId"]);
            string query = "SELECT mi.Name as ItemName, od.Quantity, mi.Price, (od.Quantity * mi.Price) as TotalPrice FROM OrderDetails od INNER JOIN MenuItems mi ON od.ItemId = mi.ItemId WHERE od.OrderId = @OrderId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@OrderId", orderId);
                conn.Open();

                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                GridViewOrderDetails.DataSource = dt;
                GridViewOrderDetails.DataBind();

                // Calculate total price
                if (dt.Rows.Count > 0)
                {
                    decimal totalPrice = dt.AsEnumerable().Sum(row => row.Field<decimal>("TotalPrice"));
                    lblTotalPrice.Text = $"Total Price: {totalPrice:C}";
                }
            }
        }

        private void LoadUsername()
        {
            if (Session["Username"] != null)
            {
                lblUsername.Text = Session["Username"].ToString();
            }
            else
            {
                lblUsername.Text = "Guest";
            }
        }
    }
}
