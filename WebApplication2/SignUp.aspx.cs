using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Insert into Users(Username,Email,Password) Values('"+txtusername.Text+"','"+TextBox1.Text+"','"+txtpassword.Text.Trim()+"')", con);
            
            
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Login_page.aspx");
            
            
        }

    }
}