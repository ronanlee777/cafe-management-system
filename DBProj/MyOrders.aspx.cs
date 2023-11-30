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
                conn.Open();
                string query = @"
                    SELECT o.OrderId, o.OrderDate, o.TotalAmount, 
                           od.ItemId, mi.Name AS ItemName, od.Quantity, od.Price
                    FROM Orders o
                    JOIN OrderDetails od ON o.OrderId = od.OrderId
                    JOIN MenuItems mi ON od.ItemId = mi.ItemId
                    WHERE o.UserId = @UserId
                    ORDER BY o.OrderId";

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
