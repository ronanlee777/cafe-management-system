using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DBProj
{
    public partial class ManageMenu : System.Web.UI.Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMenuItems();
            }
        }

        private void LoadMenuItems()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT * FROM MenuItems";
                SqlCommand cmd = new SqlCommand(query, conn);
                GridViewMenuItems.DataSource = cmd.ExecuteReader();
                GridViewMenuItems.DataBind();
            }
        }

        protected void GridViewMenuItems_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewMenuItems.EditIndex = e.NewEditIndex;
            LoadMenuItems();
        }

        protected void GridViewMenuItems_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Retrieve updated data and update database
            // Note: Ensure proper validation and error handling

            GridViewRow row = GridViewMenuItems.Rows[e.RowIndex];
            int itemId = Convert.ToInt32(GridViewMenuItems.DataKeys[e.RowIndex].Value);
            string name = (row.Cells[1].Controls[0] as TextBox).Text;
            string description = (row.Cells[2].Controls[0] as TextBox).Text;
            decimal price = Decimal.Parse((row.Cells[3].Controls[0] as TextBox).Text);
            string nutritionalInfo = (row.Cells[4].Controls[0] as TextBox).Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string updateQuery = "UPDATE MenuItems SET Name = @name, Description = @description, Price = @price, NutritionalInfo = @nutritionalInfo WHERE ItemId = @itemId";
                SqlCommand cmd = new SqlCommand(updateQuery, conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@nutritionalInfo", nutritionalInfo);
                cmd.Parameters.AddWithValue("@itemId", itemId);
                cmd.ExecuteNonQuery();
            }

            GridViewMenuItems.EditIndex = -1;
            LoadMenuItems();
        }

        protected void GridViewMenuItems_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int itemId = Convert.ToInt32(GridViewMenuItems.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string deleteQuery = "DELETE FROM MenuItems WHERE ItemId = @itemId";
                SqlCommand cmd = new SqlCommand(deleteQuery, conn);
                cmd.Parameters.AddWithValue("@itemId", itemId);
                cmd.ExecuteNonQuery();
            }

            LoadMenuItems();
        }

        protected void GridViewMenuItems_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewMenuItems.EditIndex = -1;
            LoadMenuItems();
        }
    }
}
