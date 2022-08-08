using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrder
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private string conString = "Data Source=LAPTOP-FKFUSU87\\SQLEXPRESS; Initial Catalog=Food; Integrated Security=True";
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["login"] == null)
            {
                Session["login"] = false;
            }
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("select * from Products", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand = cmd;
            sda.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            con.Close();
        }
        protected void Search_click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("select * from Products where ProductName like '" + search.Text + "%'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand = cmd;
            sda.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            con.Close();
        }
        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("UserId");
            Session["login"] = false;
        }
    }
}