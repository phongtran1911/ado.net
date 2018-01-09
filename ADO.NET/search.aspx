<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="ADO.NET.search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="table table-bordered">
             
                <tr>
                    <td>EmpCode</td>
                    <td>
                        <asp:TextBox ID="txtEmpCode" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmpCode" ForeColor="Red"
                            ValidationExpression="^[1-9]\d{0,4}$" ErrorMessage="Không được nhập ký tự và lớn hơn 5 số"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>FullName</td>
                    <td>
                        <asp:TextBox ID="txtFullname" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>CompanyName</td>
                    <td>
                        <asp:TextBox ID="txtCompany" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Tìm kiếm" OnClick="Button1_Click" CssClass="btn btn-info"/>
                        <a href="Employees.aspx" class ="btn btn-link">Quay về trang danh sách</a>

                    </td>
                </tr>



            </table>
            <asp:GridView runat="server" ID="grv" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4"
                GridLines="Horizontal" Width="1346px" CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="EmpCode" HeaderText="EmpCode" />
                    <asp:BoundField HeaderText="FullName" DataField="Fullname" />
                    <asp:BoundField HeaderText="LSCompanyName" DataField="LSCompanyName" />
                    <asp:BoundField HeaderText="LSDeptName" DataField="LSDeptName" />
                    <asp:BoundField HeaderText="JoinDate" DataField="JoinDate" />
                    <asp:BoundField HeaderText="LSJobTitleName" DataField="LSJobTitleName" />
                    <asp:BoundField HeaderText="LSNationalityName" DataField="LSNationalityName" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>

        </div>
    </form>
</body>
</html>
