using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FoodOrder
{
    public partial class Login : System.Web.UI.Page
    {
        private string conString = "Data Source=LAPTOP-FKFUSU87\\SQLEXPRESS; Initial Catalog=Food; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Session["login"] = false;
            }
        }
        protected void Login_btn(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand("select UserId from Users where Email='" + email.Text + "' and Password='" + pass.Text + "'", con);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                string id = "";
                using (SqlDataReader sd = cmd.ExecuteReader())
                {
                    while (sd.Read())
                    {
                        id += sd[0].ToString();
                    }
                }
                if (id != "")
                {
                    Session["UserId"] = id;
                    Session["login"] = "true";
                    Response.Write("<script>alert('Login Success')</script>");
                    Response.Redirect("Index.aspx", false);
                }
                else
                {
                    Response.Write("<script>alert('Username and password does not exists')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
       
    }
}