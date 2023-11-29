using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace DBProj
{
    public partial class CustomerOrderDetails : Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllOrders();
            }
        }

        private void LoadAllOrders()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = @"
                    SELECT 
                        O.OrderId,
                        U.Username,
                        O.OrderDate,
                        MI.Name AS MenuItem,
                        OD.Quantity,
                        OD.Price,
                        (OD.Quantity * OD.Price) AS TotalItemCost,
                        O.TotalAmount
                    FROM 
                        Orders O
                    INNER JOIN 
                        OrderDetails OD ON O.OrderId = OD.OrderId
                    INNER JOIN 
                        MenuItems MI ON OD.ItemId = MI.ItemId
                    INNER JOIN 
                        Users U ON O.UserId = U.UserId
                    ORDER BY 
                        O.OrderDate DESC, O.OrderId;";

                SqlCommand cmd = new SqlCommand(query, conn);

                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                GridViewOrders.DataSource = dt;
                GridViewOrders.DataBind();
            }
        }
    }
}
