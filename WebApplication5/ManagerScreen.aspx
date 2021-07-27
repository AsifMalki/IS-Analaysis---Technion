<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerScreen.aspx.cs" Inherits="WebApplication5.ManagerScreen" %>

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
        <h3>ברוך הבא מני, </h3>
        <div>
                <asp:Panel ID="Panel2" runat="server">
            <div>  
                <asp:GridView  ID="GridView1" runat="server"  AutoGenerateColumns="False" CssClass="DataGridStly" HorizontalAlign="Center"  DataKeyNames="ReportID"  OnPageIndexChanging="GridView1_PageIndexChanging"  OnRowCancelingEdit="GridView1_RowCancelingEdit"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" >  
                    <Columns>  
                        <asp:TemplateField HeaderText="מספר דיווח">
                            <%--<EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ReportID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReportID") %>'></asp:Label>
                                <asp:LinkButton ID="ReportID" CommandName="Select" runat="server"  Text='<%# Bind("ReportID") %>' >

                                </asp:LinkButton>
                            
                            </ItemTemplate>--%>
                           
                            <ItemTemplate>
                                <asp:LinkButton ID="ReportID" CommandName="Select" runat="server"  OnClick="ReportID_Click" CommandArgument='<%# Container.DataItemIndex %>'  Text='<%# Bind("ReportID") %>'   >

                            </asp:LinkButton>


                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ReporterID" HeaderText="ת.ז מדווח" ReadOnly="true" />  
                                                <asp:BoundField DataField="Employee" HeaderText="תז עובד"  />
                       <%-- <asp:TemplateField HeaderText="תז עובד">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Employee") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Employee") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="false" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
                                      <asp:ListItem Text="Open" Value="0" />   
                                      <asp:ListItem Text="Close" Value="1" />   
                                      <asp:ListItem Text="Invastigation" Value="3" />   
                                </asp:DropDownList>
                            </ItemTemplate>--%>
                        <%--</asp:TemplateField>--%>
                      <asp:BoundField DataField="ReportDate" HeaderText="תאריך דיווח" ReadOnly="true"  />
                         <asp:BoundField DataField="AssetType" HeaderText="סוג נכס" ReadOnly="true"/>
                         <asp:BoundField DataField="ReportStatus" HeaderText="סטטוס דיווח" ReadOnly="true"/>
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
               <div style="color:red;display:none" id="div_err" runat="server">
            עובד לא נמצא
        

                    
                </div>
            <div>  
                <asp:Label ID="lblresult" runat="server"></asp:Label>  
            </div>  
             <asp:Panel ID="pID" runat="server">
                 <div>
         <asp:GridView CssClass="DataGridStly"  ID="Emp" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="EmployeeID" Caption=":עובדים זמינים" >  
                    <Columns> 
                                 <asp:BoundField DataField="EmployeeID" HeaderText="ת.ז עובד " ReadOnly="true"/>
                                 <asp:BoundField DataField="FullName" HeaderText="שם מלא" ReadOnly="true"/>
                              
                            </Columns> 
              <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />  
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                     <RowStyle CssClass="RowStyle" />
    <EmptyDataRowStyle CssClass="EmptyRowStyle" />
    <PagerStyle CssClass="PagerStyle" />
    <SelectedRowStyle CssClass="SelectedRowStyle" />
    <HeaderStyle CssClass="HeaderStyle" />
    <EditRowStyle CssClass="EditRowStyle" />
    <AlternatingRowStyle CssClass="AltRowStyle" />
                </asp:GridView>
                     </div>
                 </asp:Panel>
              <div class="button">
                  <button id="Dohot"  runat="server" style="text-align:center; position:absolute" onserverclick="Dohot_ServerClick" >מעבר לדוחות</button>
               </div>
              <div class="button">
                  <a href="WebForm2.aspx">חזור</a>
               </div>
        </div>
    </form>
</body>
</html>
