using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBProj
{
    public partial class AddFoodCategory : System.Web.UI.Page
    {
        protected void SaveCategory_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";
            string categoryNameValue = categoryName.Value.Trim(); // Trim to remove any leading/trailing spaces

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Check if the category already exists
                    string checkQuery = "SELECT COUNT(*) FROM FoodCategories WHERE Name = @categoryName";
                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@categoryName", categoryNameValue);
                        int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (count > 0)
                        {
                            // Category already exists, show alert and stop further execution
                            ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", "alert('This category already exists.');", true);
                            return; // This stops the execution of the rest of the code
                        }
                    }

                    // If no duplicate, insert the new category
                    string insertQuery = "INSERT INTO FoodCategories (Name) VALUES (@categoryName)";
                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@categoryName", categoryNameValue);
                        cmd.ExecuteNonQuery();
                    }

                    // Clear the input field and notify the user of successful addition
                    categoryName.Value = "";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", "alert('Category Added');", true);
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Response.Write("Error: " + ex.Message);
            }
        }

    }
}