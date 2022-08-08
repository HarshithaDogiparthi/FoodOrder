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
    public partial class Cart : System.Web.UI.Page
    {
        private string conString = "Data Source=LAPTOP-FKFUSU87\\SQLEXPRESS; Initial Catalog=Food; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("select p.ProductId, p.ProductName, p.ProductImage, p.ProductPrice, c.quantity, sum(p.ProductPrice * c.quantity) as total from Products p join Cart c on p.ProductId = c.ProductID where c.UserId = " + Convert.ToInt32(Session["UserId"].ToString()) + " group by p.ProductId, p.ProductName, p.ProductImage, p.ProductPrice, c.quantity;", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            DataList2.DataSource = ds;
            DataList2.DataBind();
            SqlCommand cmd2 = new SqlCommand("select sum(p.ProductPrice * c.quantity) as total from Products p join Cart c on p.ProductId = c.ProductID where c.UserId = " + Convert.ToInt32(Session["UserId"].ToString()), con);
            sda = new SqlDataAdapter(cmd2);
            sda.SelectCommand = cmd2;
            ds = new DataSet();
            sda.Fill(ds);
            DataList3.DataSource = ds;
            DataList3.DataBind();
            con.Close();
        }
        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("UserId");
            Session["login"] = false;
        }
    }
}