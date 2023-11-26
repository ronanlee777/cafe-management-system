using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace DBProj
{
    public partial class CustomerRegistration : System.Web.UI.Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic here
        }
        protected void RegisterCustomer_Click(object sender, EventArgs e)
        {
            string username = Request.Form["username"];
            string password = Request.Form["password"]; // Hash this in production

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string checkUserQuery = "SELECT COUNT(*) FROM Users WHERE Username = @username";
                    using (SqlCommand checkUserCmd = new SqlCommand(checkUserQuery, conn))
                    {
                        checkUserCmd.Parameters.AddWithValue("@username", username);
                        int userExists = Convert.ToInt32(checkUserCmd.ExecuteScalar());

                        if (userExists > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Username already exists. Please choose a different username.');", true);
                            return;
                        }
                    }

                    // Insert new user
                    string insertQuery = "INSERT INTO Users (Username, Password, RoleId) VALUES (@username, @password, @roleId)";
                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                    {
                        insertCmd.Parameters.AddWithValue("@username", username);
                        insertCmd.Parameters.AddWithValue("@password", password); // Hash password
                        insertCmd.Parameters.AddWithValue("@roleId", 3);

                        insertCmd.ExecuteNonQuery();
                    }

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User Registered');", true);
                }
            }
            catch (Exception ex)
            {
                // Proper error handling
            }
        }
    }
}
