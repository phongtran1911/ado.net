using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ADO.NET
{
    public class DataAccess
    {
        public DataTable ExcuteReader(string sql)
        {
            using (SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=company;Integrated Security=True"))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable data = new DataTable();
                da.Fill(data);
                return data;
            }
        }
        public bool ExcuteNonQuery(string sql)
        {
            using (SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=company;Integrated Security=True"))
            {
                con.Open();
                SqlCommand a = new SqlCommand(sql);
                int dem = a.ExecuteNonQuery();
                if (dem == 0)
                    return false;
                return true;
            }
        }
        public DataTable ExcuteProc(string sql, List<SqlParameter> lst)
        {
            using (SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=company;Integrated Security=True"))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable data = new DataTable();

                foreach (SqlParameter x in lst)
                {
                    da.SelectCommand.Parameters.Add(x);
                }
                da.Fill(data);
                return data;
            }
        }
        public bool ExcuteNonQueryPro(string sql, List<SqlParameter> lst)
        {
            using (SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=company;Integrated Security=True"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);

                foreach (SqlParameter x in lst)
                {
                    cmd.Parameters.Add(x);
                }
                cmd.CommandType = CommandType.StoredProcedure;
                int dem = cmd.ExecuteNonQuery();
                if (dem == 0)
                    return false;
                return true;
            }
        }
    }
}