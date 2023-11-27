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
                string query = "SELECT OrderId, UserId, OrderDate, TotalAmount FROM Orders";
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
