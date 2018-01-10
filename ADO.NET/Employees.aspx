<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="ADO.NET.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <table class="table table-hover">
            <tr>
                <td class="col-md-6">
                    <label>Empcode</label></td>
                <td>
                    <asp:TextBox ID="EmpCode" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="EmpCode" ForeColor="Red">Vui lòng nhập mã</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="EmpCode" ForeColor="Red"
                        ValidationExpression="^[1-9]\d{0,4}$" ErrorMessage="Không được nhập ký tự và lớn hơn 5 số"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>JoinDate</label></td>
                <td>
                    <asp:TextBox ID="txtJoinDate" runat="server" TextMode="Date" CssClass="input-sm"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtJoinDate" ForeColor="Red">Vui lòng nhập ngày sinh</asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ControlToValidate="txtJoinDate" ErrorMessage="Sai kiểu dữ liệu ngày tháng"
                        Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>LSDeptID </label>
                </td>
                <td>
                    <asp:DropDownList ID="ddldept" runat="server" AppendDataBoundItems="True" CssClass="list-group-item">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label>LSJobtitleID</label></td>
                <td>
                    <asp:DropDownList ID="ddlJob" runat="server" AppendDataBoundItems="True" CssClass="list-group-item">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Active</label></td>
                <td>
                    <asp:RadioButton ID="rdoTrue" runat="server" Checked="true" Text="True" GroupName="rdoActive" CssClass="checkbox-inline"/>
                    <asp:RadioButton runat="server" Text="False" GroupName="rdoActive" CssClass="checkbox-inline"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>FirstName</label></td>
                <td>
                    <asp:TextBox ID="txtFirst" runat="server" CssClass="input-lg"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirst" ForeColor="Red">Vui lòng nhập tên</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtFirst" ForeColor="Red"
                        ValidationExpression="^[a-zA-Z\s\W]{0,30}" ErrorMessage="Tên không được nhập số và ký tự đặc biệt và không quá 30 ký tự"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>LastName</label></td>
                <td>
                    <asp:TextBox ID="txtLast" runat="server" CssClass="input-lg"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLast" ForeColor="Red">Vui lòng nhập tên</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtLast" ForeColor="Red"
                        ValidationExpression="^[a-zA-Z\s\W]{0,30}" ErrorMessage="Tên không được nhập số và ký tự đặc biệt và không quá 30 ký tự"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>DOB</label></td>
                <td>
                    <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="input-sm"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDOB" ForeColor="Red">Vui lòng nhập ngày sinh</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Address</label></td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="input-lg"></asp:TextBox></td>
            </tr>
            <tr >
                <td>
                    <label>Gender</label></td>
                <td>
                    <asp:RadioButton ID="rdoSex" runat="server" Text="Nam" Checked="true" GroupName="rdoSex" CssClass="checkbox-inline"/>
                    <asp:RadioButton runat="server" Text="Nữ" GroupName="rdoSex" CssClass="checkbox-inline"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>LSNationalityID</label></td>
                <td>
                    <asp:DropDownList ID="ddlNation" runat="server" AppendDataBoundItems="True" CssClass="list-group-item">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnAdd" runat="server" OnClick="Button1_Click" Text="Thêm" class="btn btn-danger" />
                    <a href="search.aspx" class="btn-link">Tìm Kiếm</a>

                </td>
            </tr>
        </table>

        <asp:GridView ID="GV1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="0px" CellPadding="0" AutoGenerateColumns="False" CssClass="table table-hover" Width="1500px">
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
    </form>
</body>
</html>
