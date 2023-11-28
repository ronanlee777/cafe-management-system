using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DBProj
{
    public partial class ViewInventoryOrders : System.Web.UI.Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadInventoryOrders();
            }
        }

        private void LoadInventoryOrders()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT * FROM InventoryStockOrders";
                SqlCommand cmd = new SqlCommand(query, conn);
                GridViewInventoryOrders.DataSource = cmd.ExecuteReader();
                GridViewInventoryOrders.DataBind();
            }
        }
    }
}
