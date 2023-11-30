using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace DBProj
{
    public partial class CustomerHomePage : Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";
        private const string DefaultCustomerName = "Guest";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string username = Session["Username"] != null ? Session["Username"].ToString() : DefaultCustomerName;
                LoadCustomerDetails(username);
            }
        }

        private void LoadCustomerDetails(string username)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        // Nested subquery to get total loyalty points for the user
                        string query = @"
                            SELECT Username, 
                            (SELECT SUM(Points) FROM LoyaltyPoints WHERE UserId = u.UserId) AS TotalPoints
                            FROM Users u WHERE Username = @username";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@username", username);

                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    string customerName = reader["Username"].ToString();
                                    int totalPoints = reader["TotalPoints"] != DBNull.Value ? Convert.ToInt32(reader["TotalPoints"]) : 0;
                                    lblCustomerName.Text = $"{customerName}";
                                    lblPoints.Text =  $"{totalPoints}";
                                }
                                else
                                {
                                    lblCustomerName.Text = DefaultCustomerName;
                                }
                            }
                        }
                    }
                    else
                    {
                        lblCustomerName.Text = "Error: Unable to establish a database connection.";
                    }
                }
            }
            catch (SqlException ex)
            {
                HandleException(ex);
            }
            catch (Exception ex)
            {
                HandleException(ex);
            }
        }

        private void HandleException(Exception ex)
        {
            // Error handling logic
            lblCustomerName.Text = $"Error loading details. Exception: {ex.Message}";
        }
    }
}
