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
                string username = Session["Username"] != null ? Session["Username"].ToString() : "Guest";
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

                    // Check if the connection is successful
                    if (conn.State == ConnectionState.Open)
                    {
                        // Adjust the query to select the 'userame' column associated with the username
                        string query = "SELECT Username FROM Users WHERE Username = @username";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@username", username);

                            object result = cmd.ExecuteScalar();
                            lblCustomerName.Text = result != null ? $" {result.ToString()}" : DefaultCustomerName;
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
            // Log the exception details for debugging
            // Log.Error($"An error occurred: {ex.Message}", ex);
            lblCustomerName.Text = $"Error loading details. Exception: {ex.Message}";
        }
    }
}
