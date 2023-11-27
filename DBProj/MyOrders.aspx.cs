using System;
using System.Data;
using System.Data.SqlClient;

namespace DBProj
{
    public partial class MyOrders : System.Web.UI.Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            int userId = Convert.ToInt32(Session["UserId"]); // Retrieve the user ID from session

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT OrderId, OrderDate, TotalAmount FROM Orders WHERE UserId = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);

                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                GridViewOrders.DataSource = dt;
                GridViewOrders.DataBind();
            }
        }
    }
}
