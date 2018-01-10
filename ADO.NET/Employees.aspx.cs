using log4net;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADO.NET
{
    public partial class Employees : System.Web.UI.Page
    {
        private static readonly ILog _logger = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        protected void Page_Load(object sender, EventArgs e)
        {
            _logger.Info("Start program.");

            try
            {
                string s = "abc";
                int i = int.Parse(s);
            }
            catch (Exception ex)
            {
                _logger.Debug(ex);
            }

            _logger.Info("Stop program.");
            DataAccess a = new DataAccess();
                string da = "select * from HR_tblEmp";
                string da1 = "select LSDeptID from LS_tblDepartment";
                string da2 = "select LSJobTitleID from LS_tblJobTitle";
                string da3 = "select LSNationalityID from LS_tblNationality";

                GV1.DataSource = a.ExcuteReader(da);
                GV1.DataBind();

                ddldept.DataSource = a.ExcuteReader(da1);
                ddldept.DataTextField = "LSDeptID";
                ddldept.DataValueField = "LSDeptID";
                ddldept.DataBind();

                ddlJob.DataSource = a.ExcuteReader(da2);
                ddlJob.DataTextField = "LSJobTitleID";
                ddlJob.DataValueField = "LSJobTitleID";
                ddlJob.DataBind();

                ddlNation.DataSource = a.ExcuteReader(da3);
                ddlNation.DataTextField = "LSNationalityID";
                ddlNation.DataValueField = "LSNationalityID";
                ddlNation.DataBind();
        }
        public bool IsNumber(string pText)
        {
            Regex regex = new Regex(@"^[-+]?[0-9]*\.?[0-9]+$");
            return regex.IsMatch(pText);
        }
        public int kiemtrangay()
        {
            DateTime now = DateTime.Now;
            DateTime date = DateTime.Parse(txtDOB.Text);
            TimeSpan time = now - date;
            int tongsongay = time.Days;
            return tongsongay;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "select * from HR_tblEmp";
            DataAccess db = new DataAccess();

            string Gender = "";
            if (rdoSex.Checked == true)
            {
                Gender = "1";
            }
            else
            {
                Gender = "0";
            }
            int Active;
            if (rdoTrue.Checked == true)
            {
                Active = 1;
            }
            else
            {
                Active = 0;
            }
            if (EmpCode.Text.Length < 0 || txtAddress.Text.Length < 0 || txtDOB.Text.Length < 0 || txtFirst.Text.Length < 0 ||
                txtJoinDate.Text.Length < 0 || txtLast.Text.Length < 0)
                Response.Write("Vui lòng nhập đầy đủ các thông tin trên");

            else if (EmpCode.Text.Length > 5)
                Response.Write("Mã không được quá 5 số");

            else if (txtFirst.Text.Length > 30 || txtLast.Text.Length > 30)
                Response.Write("Tên không quá 30 ký tự");

            else if (kiemtrangay() < 6570)
                Response.Write("Bạn chưa đủ 18 tuổi");

            else if (IsNumber(EmpCode.Text) == false)
                Response.Write("Mã không nhập ký tự");
            else
            {

                List<SqlParameter> lst = new List<SqlParameter>();
                lst.Add(new SqlParameter("@EmpCode", EmpCode.Text));
                lst.Add(new SqlParameter("@JoinDate", txtJoinDate.Text));
                lst.Add(new SqlParameter("@LSDeptID", ddldept.SelectedValue.ToString()));
                lst.Add(new SqlParameter("@LSJobTitleID", ddlJob.SelectedValue.ToString()));
                lst.Add(new SqlParameter("@Active", Active));
                lst.Add(new SqlParameter("@FirstName", txtFirst.Text));
                lst.Add(new SqlParameter("@LastName", txtLast.Text));
                lst.Add(new SqlParameter("@DOB", txtDOB.Text));
                lst.Add(new SqlParameter("@Address", txtAddress.Text));
                lst.Add(new SqlParameter("@Gender", Gender));
                lst.Add(new SqlParameter("@LSNationalityID", ddlNation.SelectedValue.ToString()));

                db.ExcuteNonQueryPro("sp_F02", lst);
                GV1.DataSource = db.ExcuteReader(sql);
                GV1.DataBind();
                Response.Write("Success!");
            }
        }
    }
}