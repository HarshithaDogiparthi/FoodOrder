using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrder
{
    public partial class AddProducts : System.Web.UI.Page
    {
        private string conString = "Data Source=LAPTOP-FKFUSU87\\SQLEXPRESS; Initial Catalog=Food; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string file = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs("C:\\Users\\egkis\\Downloads\\Virtusa\\C#\\FoodOrder\\FoodOrder\\Images\\" + file);
                SqlConnection con = new SqlConnection(conString);
                TextBox3.Text = file;
                string path = "Images//";
                path += FileUpload1.FileName;
                SqlCommand cmd = new SqlCommand("insert into Products(ProductName, ProductImage, ProductPrice) values('" + TextBox1.Text + "', '" + path + "', '" + TextBox2.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                TextBox3.Text = ex.Message;
            }
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Inserted')");
        }
    }
}