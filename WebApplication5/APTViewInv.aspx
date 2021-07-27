<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="APTViewInv.aspx.cs" Inherits="WebApplication5.APTViewInv" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head  runat="server" >
    <link href="RegStyle.css" rel="stylesheet" />
    <title>פרטי תיק דיווח</title>
    
</head>
<body>
    <form id="form1" runat="server">
        <h1>פרטי תיק דיווח</h1>
        <div>
            
            <table border="0" cellpedding="5" cellspacing="0">

<tr>
    <td>מס דיווח</td>
    <td><asp:TextBox ID = "TextBox1" runat = "server" /></td>
</tr>
<tr>
    <td>רחוב</td>
    <td><asp:TextBox ID = "City" runat = "server" /></td>
</tr>
<tr>
    <td>עיר</td>
    <td><asp:TextBox ID = "Street" runat = "server" /></td>
</tr>
<tr>
    <td>מספר בית</td>
    <td><asp:TextBox ID = "Housenum" runat = "server" /></td>
</tr>
                <tr>
    <td>מספר דירה</td>
    <td><asp:TextBox ID = "TextBox2" runat = "server" /></td>
</tr>
                <tr>
    <td>כניסה</td>
    <td><asp:TextBox ID = "TextBox3" runat = "server" /></td>
</tr>
                <tr>
    <td>מיקוד</td>
    <td><asp:TextBox ID = "TextBox4" runat = "server" /></td>
</tr>
                <tr>
    <td>בעלים</td>
    <td><asp:TextBox ID = "TextBox5" runat = "server" /></td>
</tr>
                <tr>
    <td>תאור</td>
    <td><asp:TextBox ID = "TextBox6" runat = "server" /></td>
</tr>
</table>
        </div>
         <div class="button">
                  <button id="Dohot" runat="server" onserverclick="Dohot_ServerClick" >חזור</button>
               </div>
    </form>
</body>
</html>
