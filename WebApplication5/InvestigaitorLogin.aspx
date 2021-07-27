<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvestigaitorLogin.aspx.cs" Inherits="WebApplication5.InvestigaitorLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
  <link href="StyleSheet2.css" rel="stylesheet" />
  <title style="font-size:large; color:cornflowerblue">
    מסך ריכוז דיווחים
  </title>
   <link href="DataGridStly.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <h1>מסך ריכוז דיווחים</h1>
        <h3>ברוך הבא, משה </h3>
        <div>
                <asp:Panel ID="Panel2" runat="server">
            <div>  
                <asp:GridView  ID="GridView1" runat="server"  AutoGenerateColumns="False" CssClass="DataGridStly" HorizontalAlign="Center"  DataKeyNames="ReportID"  OnPageIndexChanging="GridView1_PageIndexChanging"  OnRowCancelingEdit="GridView1_RowCancelingEdit"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" >  
                    <Columns>  
                        <asp:TemplateField HeaderText="מספר דיווח">
                                             
                            <ItemTemplate>
                                <asp:LinkButton ID="ReportID" CommandName="Select" runat="server"  OnClick="ReportID_Click" CommandArgument='<%# Container.DataItemIndex %>'  Text='<%# Bind("ReportID") %>'   >

                            </asp:LinkButton>


                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ReporterID" HeaderText="ת.ז מדווח" ReadOnly="true" />  
                        <asp:BoundField DataField="Employee" HeaderText="תז עובד" ReadOnly="true" />
                        <asp:BoundField DataField="ReportDate" HeaderText="תאריך דיווח" ReadOnly="true" />
                         <asp:BoundField DataField="AssetType" HeaderText="סוג נכס" ReadOnly="true"/>
                         <asp:BoundField DataField="ReportStatus" HeaderText="סטטוס דיווח" />
                         <asp:BoundField DataField="Remarks" HeaderText="הערות"  />
                        <asp:CommandField ShowEditButton="true" />  
                        <asp:CommandField ShowDeleteButton="false" /> 
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
                    </asp:Panel>
              <div class="button">
                  <a href="WebForm2.aspx">חזור</a>
               </div>
            </div>
    </form>
</body>
</html>
