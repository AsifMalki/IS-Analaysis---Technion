<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Apartments.aspx.cs" Inherits="WebApplication5.Apartments" %>

<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <!---<title> Responsive Registration Form | CodingLab </title>--->
    <link rel="stylesheet" href="RegStyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div class="container">
        <div class="title">דיווח על דירה</div>
        <div class="content">
            <form id="form1" runat="server">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details">עיר</span>
                    <%--<div class="header">   
                        הכנס עיר
               
                    </div> --%>
                    <asp:DropDownList ID=City runat="server" AutoPostBack="true" OnSelectedIndexChanged="City_SelectedIndexChanged">
                           <asp:ListItem Text="בחר עיר" Value="0" />   

                    </asp:DropDownList>
                             </div>
                    <div class="input-box">
                        <span class="details">רחוב</span>
                          <asp:DropDownList ID=Streets runat="server" AutoPostBack="true">
                               <asp:ListItem Text="בחר רחוב" Value="0" /> 
                    </asp:DropDownList> 

                    </div>
                    <div class="input-box">
                        <span class="details">מספר בית</span>
                        <input type="text" placeholder="הכנס מספר"  id="HouseNum" runat="server" required>
                    </div>

                    <div class="input-box">
                        <span class="details">כניסה</span>
                        <input type="text" placeholder="הכנס כניסה"  id="Entrance" runat="server" required>
                    </div>
                    <div class="input-box">
                        <span class="details">מספר דירה</span>
                        <input type="text" placeholder="הכנס מס דירה"  id="ApartmentNum" runat="server" required>
                    </div>
                    <div class="input-box">
                        <span class="details">מיקוד</span>
                        <input type="text" placeholder="הכנס מיקוד"  id="PostalCode" runat="server" required>
                    </div>
                    <div class="input-box">
                        <span class="details">בעלים</span>
                        <input type="text" placeholder="ציין מי בעלי הדירה"  id="Owner" runat="server" required>
                    </div>
                    <div class="input-box">
                        <span class="details">תאור</span>
                        <input type="text" placeholder="תאר את פרטי הדירה"  id="Desc" runat="server" required>
                    </div>
                </div>
                <div>
                    <button id="APTReport" runat="server" onserverclick="APTReport_ServerClick"> שליחת דיווח </button>
                </div>
               <div class="button">
                  <a href="WebForm2.aspx">חזור</a>
               </div>
            </form>
        </div>
    </div>

</body>
</html>
