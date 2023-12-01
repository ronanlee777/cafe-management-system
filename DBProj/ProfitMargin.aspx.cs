using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace DBProj
{
    public partial class ProfitMargin : Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";
        public decimal TotalProfit { get; private set; } // Property to store total profit

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfitMargins();
            }
        }

        private void LoadProfitMargins()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = @"
                    SELECT  MI.ItemId, MI.Name AS MenuItem, SUM(OD.Quantity * OD.Price) AS TotalSalesRevenue,
                        (SELECT SUM(Price * QuantityOrdered) FROM InventoryStockOrders) AS TotalInventoryCost,
                        SUM(OD.Quantity * OD.Price) - (SELECT SUM(Price * QuantityOrdered) FROM InventoryStockOrders) AS TotalProfit
                    FROM  MenuItems MI
                    JOIN  OrderDetails OD ON MI.ItemId = OD.ItemId
                    JOIN Orders O ON OD.OrderId = O.OrderId
                    GROUP BY MI.ItemId, MI.Name;";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                decimal totalProfit = 0;
                DataTable dt = new DataTable();
                dt.Load(reader);
                foreach (DataRow row in dt.Rows)
                {
                    totalProfit += Convert.ToDecimal(row["TotalProfit"]);
                }
                TotalProfit = totalProfit; // Set the total profit

                GridViewProfitMargins.DataSource = dt;
                GridViewProfitMargins.DataBind();

                lblTotalProfit.Text = $"Total Profit: {TotalProfit.ToString("C")}"; // Set the label text
            }
        }
    }
}
