<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication5.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MedaveahID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:SqlDataSource runat="server"></asp:SqlDataSource>
                hmail" HeaderText="Medaveahmail" SortExpression="Medaveahmail" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CHECHKConnectionString %>" SelectCommand="SELECT [MedaveahID], [ShemPrati], [ShemMishpaha], [Medaveahmail] FROM [Medaveah] ORDER BY [MedaveahID]"></asp:SqlDataSource>
    </form>
</body>
</html>
