<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form1.aspx.cs" Inherits="WebApplication5.Form1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">  
    <title></title>  
</head>  
<body>  
    <form id="form11" runat="server">  
    <div>  
      
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"   
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"   
            CellPadding="3" DataKeyNames="ReportID" GridLines="Vertical"   
            onrowdatabound="GridView2_RowDataBound" OnRowEditing="GridView2_RowEditing" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowUpdating="GridView2_RowUpdating" OnPageIndexChanging="GridView2_PageIndexChanging" OnPageIndexChanged="GridView2_PageIndexChanged">  
            <AlternatingRowStyle BackColor="#DCDCDC" />  
            <Columns>  
                <asp:TemplateField HeaderText="מס דיווח">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReportID") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReportID") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="תז מדווח">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ReporterID") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ReporterID") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="EmployeeID">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:DropDownList ID="DropDownList1" runat="server">  
                        </asp:DropDownList>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="תאריך דיווח">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ReportDate") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ReportDate") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                   <asp:TemplateField HeaderText="סוג נכס">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("AssetType") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("AssetType") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                   <asp:TemplateField HeaderText="סטטוס דיווח">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ReportStatus") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ReportStatus") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                   <asp:TemplateField HeaderText="הערות">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                  <asp:CommandField ShowEditButton="true" />  
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