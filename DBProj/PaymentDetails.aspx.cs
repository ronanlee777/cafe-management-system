using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DBProj
{
    public partial class PaymentDetails : System.Web.UI.Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPaymentDetails();
            }
        }

        private void LoadPaymentDetails()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                // Modified SQL query with JOIN
                string query = @"
                    SELECT 
                        O.OrderId, 
                        U.Username, 
                        O.OrderDate, 
                        O.TotalAmount 
                    FROM 
                        Orders O
                    INNER JOIN 
                        Users U ON O.UserId = U.UserId";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                GridViewPayments.DataSource = dt;
                GridViewPayments.DataBind();

                if (dt.Rows.Count > 0)
                {
                    decimal totalEarnings = dt.AsEnumerable().Sum(row => row.Field<decimal>("TotalAmount"));
                    lblTotalEarnings.Text = $"Total Earnings: {totalEarnings:C}";
                }
            }
        }
    }
}
