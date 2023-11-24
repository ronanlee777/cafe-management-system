using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBProj
{
    public partial class AddMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateCategoriesDropDown();
            }
        }

        private void PopulateCategoriesDropDown()
        {
            string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";
            string query = "SELECT CategoryId, Name FROM FoodCategories";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                ddlCategories.DataSource = reader;
                ddlCategories.DataTextField = "Name";
                ddlCategories.DataValueField = "CategoryId";
                ddlCategories.DataBind();

                reader.Close();
            }

            ddlCategories.Items.Insert(0, new ListItem("--Select Category--", "0"));
        }

        protected void SaveMenuItem_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=AHSANELITEBOOK\\SQLEXPRESS;Initial Catalog=WebApp;Integrated Security=True";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "INSERT INTO MenuItems (CategoryId, Name, Description, Price, NutritionalInfo) VALUES (@categoryId, @name, @description, @price, @nutritionalInfo)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@categoryId", ddlCategories.SelectedValue);
                        cmd.Parameters.AddWithValue("@name", itemName.Value);
                        cmd.Parameters.AddWithValue("@description", itemDescription.Value);
                        cmd.Parameters.AddWithValue("@price", Decimal.Parse(itemPrice.Value));
                        cmd.Parameters.AddWithValue("@nutritionalInfo", itemNutritionalInfo.Value);

                        cmd.ExecuteNonQuery();
                    }
                }

                // Clear form fields and show success message
                itemName.Value = "";
                itemDescription.Value = "";
                itemPrice.Value = "";
                itemNutritionalInfo.Value = "";
                ddlCategories.SelectedIndex = 0;

                ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", "alert('Menu Item Added');", true);
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}
