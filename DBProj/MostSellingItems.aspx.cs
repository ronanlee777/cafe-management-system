using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace DBProj
{
    public partial class MostSellingItems : Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTopSellingItems();
            }
        }

        private void LoadTopSellingItems()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = @"
                    SELECT MI.Name AS MenuItem, COUNT(OD.ItemId) AS NumberOfOrders, SUM(OD.Quantity) AS TotalQuantitySold, SUM(OD.Quantity * OD.Price) AS TotalRevenue
                    FROM MenuItems MI
                    INNER JOIN OrderDetails OD ON MI.ItemId = OD.ItemId
                    INNER JOIN Orders O ON OD.OrderId = O.OrderId
                    GROUP BY MI.Name
                    ORDER BY TotalRevenue DESC;
                    ";

                SqlCommand cmd = new SqlCommand(query, conn);

                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                GridViewTopSellingItems.DataSource = dt;
                GridViewTopSellingItems.DataBind();
            }
        }
    }
}
