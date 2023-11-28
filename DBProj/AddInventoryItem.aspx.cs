using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace DBProj
{
    public partial class AddInventoryItem : System.Web.UI.Page
    {
        protected void SaveInventoryItem_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "INSERT INTO Inventory (Name, Quantity) VALUES (@name, @quantity)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@name", itemName.Value);
                        cmd.Parameters.AddWithValue("@quantity", Convert.ToInt32(itemQuantity.Value));

                        cmd.ExecuteNonQuery();
                    }
                }

                // Clear form fields and show success message
                itemName.Value = "";
                itemQuantity.Value = "";

                ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", "alert('Inventory Item Added');", true);
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}
