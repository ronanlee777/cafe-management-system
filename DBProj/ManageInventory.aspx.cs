using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DBProj
{
    public partial class ManageInventory : System.Web.UI.Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadInventoryItems();
            }
        }

        private void LoadInventoryItems()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = @"
            SELECT i.ItemID, i.Name, i.Quantity, iso.OrderDate, iso.QuantityOrdered 
            FROM Inventory i
            LEFT JOIN InventoryStockOrders iso ON i.ItemID = iso.ItemID";
                SqlCommand cmd = new SqlCommand(query, conn);
                GridViewInventory.DataSource = cmd.ExecuteReader();
                GridViewInventory.DataBind();
            }
        }


        protected void GridViewInventory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewInventory.EditIndex = e.NewEditIndex;
            LoadInventoryItems();
        }

        protected void GridViewInventory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewInventory.Rows[e.RowIndex];
            int itemID = Convert.ToInt32(GridViewInventory.DataKeys[e.RowIndex].Value);
            int quantity = Convert.ToInt32((row.Cells[2].Controls[0] as TextBox).Text);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string updateQuery = "UPDATE Inventory SET Quantity = @quantity WHERE ItemID = @itemID";
                SqlCommand cmd = new SqlCommand(updateQuery, conn);
                cmd.Parameters.AddWithValue("@quantity", quantity);
                cmd.Parameters.AddWithValue("@itemID", itemID);
                cmd.ExecuteNonQuery();
            }

            GridViewInventory.EditIndex = -1;
            LoadInventoryItems();
        }

        protected void GridViewInventory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewInventory.EditIndex = -1;
            LoadInventoryItems();
        }
    }
}
