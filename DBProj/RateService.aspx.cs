using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace DBProj
{
    public partial class RateService : Page
    {
        private string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize page if needed.
            }
        }

        protected void SubmitRating(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserId"]); // Assuming user ID is stored in session
            int rating = Convert.ToInt32(ddlRating.SelectedValue);
            string comments = txtComments.Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = @"
                    IF NOT EXISTS (
                        SELECT 1 FROM CustomerRatings 
                        WHERE UserID = @UserId
                    )
                    BEGIN
                        INSERT INTO CustomerRatings (UserID, Rating, Comments) 
                        VALUES (@UserId, @Rating, @Comments)
                    END";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@Rating", rating);
                cmd.Parameters.AddWithValue("@Comments", comments);

                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected == 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('You have already rated.');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Rating Saved');", true);
                }
            }

            // Optional: Code to handle after successful submission, like showing a message or redirecting.
        }
    }
}
