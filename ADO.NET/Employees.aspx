<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="ADO.NET.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Empcode&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="EmpCode" runat="server" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="EmpCode" ForeColor="Red">Vui lòng nhập mã</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ControlToValidate="EmpCode" ForeColor="Red"
                ValidationExpression="^[1-9]\d{0,4}$" ErrorMessage="Không được nhập ký tự và lớn hơn 5 số"></asp:RegularExpressionValidator>
            <br />
            JoinDate&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtJoinDate" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtJoinDate" ForeColor="Red">Vui lòng nhập ngày sinh</asp:RequiredFieldValidator>
            <asp:CompareValidator runat="server" ControlToValidate="txtJoinDate" ErrorMessage="Sai kiểu dữ liệu ngày tháng"
                Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
            <br />
            LSDeptID&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:DropDownList ID="ddldept" runat="server" AppendDataBoundItems="True">
            </asp:DropDownList>
            <br />
            LSJobtitleID&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlJob" runat="server" AppendDataBoundItems="True">
            </asp:DropDownList>

            <br />
            Active&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="rdoTrue" runat="server" Checked="true" Text="True" GroupName="rdoActive" />
            <asp:RadioButton runat="server" Text="False" GroupName="rdoActive"/>
            <br />
            &nbsp;FirstName<asp:TextBox ID="txtFirst" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirst" ForeColor="Red">Vui lòng nhập tên</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtFirst" ForeColor="Red"
                ValidationExpression="^[a-zA-Z\s\W]{0,30}" ErrorMessage="Tên không được nhập số và ký tự đặc biệt và không quá 30 ký tự"></asp:RegularExpressionValidator>
            <br />
            LastName<asp:TextBox ID="txtLast" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLast" ForeColor="Red">Vui lòng nhập tên</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtLast" ForeColor="Red"
                ValidationExpression="^[a-zA-Z\s\W]{0,30}" ErrorMessage="Tên không được nhập số và ký tự đặc biệt và không quá 30 ký tự"></asp:RegularExpressionValidator>
            <br />
            DOB<asp:TextBox ID="txtDOB" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDOB" ForeColor="Red">Vui lòng nhập ngày sinh</asp:RequiredFieldValidator>

            <br />
            Address<asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            <br />
            Gender
            <asp:RadioButton ID="rdoSex" runat="server" Text="Nam" Checked="true" GroupName="rdoSex"/>
            <asp:RadioButton runat="server" Text="Nữ" GroupName="rdoSex"/>
            <br />
            LSNationalityID<asp:DropDownList ID="ddlNation" runat="server" AppendDataBoundItems="True">
            </asp:DropDownList>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Button ID="btnAdd" runat="server" OnClick="Button1_Click" Text="Thêm" />
            <a href="search.aspx">Tìm Kiếm</a>
            &nbsp;
            <asp:GridView ID="GV1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" Width="1003px">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField HeaderText="EmpID" DataField="EmpID" />
                    <asp:BoundField HeaderText="EmpCode" DataField="EmpCode" />
                    <asp:BoundField HeaderText="JoinDate" DataField="JoinDate" />
                    <asp:BoundField HeaderText="LSDeptID" DataField="LSDepID" />
                    <asp:BoundField HeaderText="LSJobTitleID" DataField="LSJobTitleID" />
                    <asp:BoundField HeaderText="Active" DataField="Active" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
