using System;
using System.Data.SqlClient;

namespace DBProj
{
    public partial class Profile : System.Web.UI.Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            int userId = Convert.ToInt32(Session["UserId"]);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Fetch user details
                string userQuery = "SELECT UserId, Username, Password FROM Users WHERE UserId = @UserId";
                SqlCommand userCmd = new SqlCommand(userQuery, conn);
                userCmd.Parameters.AddWithValue("@UserId", userId);

                using (SqlDataReader reader = userCmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        lblUserId.Text = reader["UserId"].ToString();
                        lblUsername.Text = reader["Username"].ToString();
                        lblPassword.Text = reader["Password"].ToString();
                    }
                }

                // Nested subquery 1: Fetch total number of orders
                string ordersQuery = @"
                    SELECT COUNT(*) FROM Orders 
                    WHERE UserId = (SELECT UserId FROM Users WHERE UserId = @UserId)";
                SqlCommand ordersCmd = new SqlCommand(ordersQuery, conn);
                ordersCmd.Parameters.AddWithValue("@UserId", userId);
                int totalOrders = (int)ordersCmd.ExecuteScalar();
                lblTotalOrders.Text = totalOrders.ToString(); // Assuming lblTotalOrders exists

                // Nested subquery 2: Fetch total loyalty points
                string pointsQuery = @"
                    SELECT SUM(Points) FROM LoyaltyPoints 
                    WHERE UserId = (SELECT UserId FROM Users WHERE UserId = @UserId)";
                SqlCommand pointsCmd = new SqlCommand(pointsQuery, conn);
                pointsCmd.Parameters.AddWithValue("@UserId", userId);
                object totalPoints = pointsCmd.ExecuteScalar();
                lblLoyaltyPoints.Text = totalPoints != DBNull.Value ? totalPoints.ToString() : "0";
            }
        }
    }
}
