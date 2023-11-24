using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Data;
using MySql.Data.MySqlClient;


namespace DBProj
{
    public partial class Registration : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Your page load logic (if any)
        }


        protected void Submit_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "INSERT INTO Users (Username, Password, Email) VALUES (@username, @password, @email)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", username.Value);
                        cmd.Parameters.AddWithValue("@password", password.Value); // Consider hashing the password
                        cmd.Parameters.AddWithValue("@email", email.Value);

                        cmd.ExecuteNonQuery();
                    }
                }
                // Optionally, add logic to inform the user of successful registration
            }
            catch (Exception ex)
            {
                // Handle your exceptions here
                 Response.Write("Error: " + ex.Message);
            }
        }

    }
}
