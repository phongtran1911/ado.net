using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADO.NET
{
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtEmpCode.Text.Length == 0 && txtCompany.Text.Length == 0 && txtFullname.Text.Length == 0)
            {
                Response.Write("Vui lòng điền thông tin để có thể tìm");
            }
            else
            {
                DataAccess db = new DataAccess();
                List<SqlParameter> lst = new List<SqlParameter>();
                lst.Add(new SqlParameter("@empcode", txtEmpCode.Text));
                lst.Add(new SqlParameter("@fullname", txtFullname.Text));
                lst.Add(new SqlParameter("@company", txtCompany.Text));

                DataTable data = db.ExcuteProc("sp_F03", lst);
                if (data.Rows.Count == 0)
                {
                    Response.Write("Khong co nhan vien nay trong cong ty");
                    grv.DataSource = null;
                    grv.DataBind();
                }
                else
                {
                    grv.DataSource = data;
                    grv.DataBind();
                }
            }
        }
    }
}