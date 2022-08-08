using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrder
{
    public partial class Signup : System.Web.UI.Page
    {
        private string conString = "Data Source=LAPTOP-FKFUSU87\\SQLEXPRESS; Initial Catalog=Food; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Session["login"] = false;
            }
        }
        protected void Signup_btn(object sender, EventArgs e)
        {
            if (pass.Text != rpass.Text)
            {
                Response.Write("<script>alert('Password and Repeat Password does not matched')</script>");
            }
            else
            {
                string sqlstring = "select 1 from Users where Email='" + email.Text + "'";
                SqlConnection sqlcon = new SqlConnection(conString);
                sqlcon.Open();
                SqlCommand cmd = new SqlCommand(sqlstring, sqlcon);
                SqlDataReader sd = cmd.ExecuteReader();
                bool flag = sd.Read() ? true : false;
                if (flag)
                {
                    Response.Write("<script>alert('User already exists')</script>");
                }
                else
                {
                    sd.Close();
                    SqlCommand cmd1 = new SqlCommand("insert into Users(Email, Password) values('" + email.Text + "', '" + pass.Text + "')", sqlcon);
                    cmd1.ExecuteNonQuery();
                    Response.Write("<script>alert('Signup Successful')</script>");
                    Response.Redirect("Login.aspx");
                }
            }
        }
        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}