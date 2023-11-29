using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace DBProj
{
    public partial class MostSellingCategory : Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTopSellingCategories();
            }
        }

        private void LoadTopSellingCategories()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = @"
                    SELECT 
                        FC.Name AS CategoryName,
                        SUM(OD.Quantity * OD.Price) AS TotalRevenue
                    FROM 
                        FoodCategories FC
                    INNER JOIN 
                        MenuItems MI ON FC.CategoryId = MI.CategoryId
                    INNER JOIN 
                        OrderDetails OD ON MI.ItemId = OD.ItemId
                    INNER JOIN 
                        Orders O ON OD.OrderId = O.OrderId
                    GROUP BY 
                        FC.Name
                    ORDER BY 
                        TotalRevenue DESC;";

                SqlCommand cmd = new SqlCommand(query, conn);

                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                GridViewTopSellingCategories.DataSource = dt;
                GridViewTopSellingCategories.DataBind();
            }
        }
    }
}
