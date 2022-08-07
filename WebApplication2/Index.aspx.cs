using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodOrdering
{
    public partial class Index : System.Web.UI.Page
    {
        private string constring = "Data Source=.; Initial Catalog=HotelDb; Integrated Security=True";
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["login"] = "true";
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("select * from Items", con);
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
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("select * from Items where Itemname like '" + search.Text + "%'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand = cmd;
            sda.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            con.Close();
        }
    }
}