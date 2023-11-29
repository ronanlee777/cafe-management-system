using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace DBProj
{
    public partial class CustomerReviews : Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCustomerReviews("ASC"); // Default sorting
            }
        }

        protected void btnSortAsc_Click(object sender, EventArgs e)
        {
            LoadCustomerReviews("ASC");
        }

        protected void btnSortDesc_Click(object sender, EventArgs e)
        {
            LoadCustomerReviews("DESC");
        }

        private void LoadCustomerReviews(string sortOrder)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = $@"
                    SELECT 
                        U.Username AS CustomerName,
                        CR.Rating AS CustomerRating,
                        CR.Comments AS Comments
                    FROM 
                        Users U
                    INNER JOIN 
                        CustomerRatings CR ON U.UserId = CR.UserID
                    ORDER BY 
                        CR.Rating {sortOrder};";

                SqlCommand cmd = new SqlCommand(query, conn);

                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                GridViewCustomerReviews.DataSource = dt;
                GridViewCustomerReviews.DataBind();
            }
        }
    }
}
