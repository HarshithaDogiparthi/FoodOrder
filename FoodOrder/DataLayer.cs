using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace FoodOrder
{
    public class DataLayer 
    {
        private string con = "Data Source=LAPTOP-FKFUSU87\\SQLEXPRESS; Initial Catalog=Food; Integrated Security=True";
        public void Execute(string sqlstring)
        {
            SqlConnection sqlcon = new SqlConnection(con);
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand(sqlstring, sqlcon);
            cmd.ExecuteNonQuery();
            sqlcon.Close();
        }
    }
}