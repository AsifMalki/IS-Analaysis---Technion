<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication5.Register" %>

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
        <div class="title">הרשמה</div>
        <div class="content">
            <form id="form1" runat="server">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details">תעודת זהות</span>
                        <input type="text" placeholder="הכנס תעודת זהות" id="ID_txt" runat="server" required>
                    </div>
                    <div class="input-box">
                        <span class="details">שם פרטי</span>
                        <input type="text" placeholder="הכנס את שמך הפרטי"  id="FirstName" runat="server" required>
                    </div>
                    <div class="input-box">
                        <span class="details">שם משפחה</span>
                        <input type="text" placeholder="הכנס שם משפחה"  id="LastName" runat="server" required>
                    </div>

                    <div class="input-box">
                        <span class="details">כתובת אימייל</span>
                        <input type="text" placeholder="הכנס כתובת מייל"  id="ReporterMail" runat="server" required>
                    </div>
                    <div class="input-box">
                        <span class="details">מספר טלפון</span>
                        <input type="text" placeholder="הכנס מספר טלפון"  id="ReporterPhone" runat="server" required>
                    </div>
                    <div class="input-box">
                        <span class="details">ססמא</span>
                        <input type="password" placeholder="הכנס ססמא"  id="Pass" runat="server" required>
                    </div>
                    <div class="input-box">
                        <span class="details">אימות ססמא</span>
                        <input type="password" placeholder="הכנס ססמא בשנית"  id="Pass2" runat="server" required>
                    </div>
                    <div class="input-box">
                        <span class="details">תאריך לידה</span>
                        <input type="date"  id="BDate" runat="server" required>
                    </div>
                </div>
<%--                <div class="gender-details">
                    <input type="radio" name="מגדר" id="dot-1">
                    <input type="radio" name="מגדר" id="dot-2">
                    <input type="radio" name="מגדר" id="dot-3">
                    <span class="gender-title">מגדר</span>
                    <div class="category">
                        <label for="dot-1">
                            <span class="dot one"></span>
                            <span class="gender">זכר</span>
                        </label>
                        <label for="dot-2">
                            <span class="dot two"></span>
                            <span class="gender">נקבה</span>
                        </label>
                        <label for="dot-3">
                            <span class="dot three"></span>
                            <span class="gender">אחר</span>
                        </label>
                    </div>
                </div>--%>
                <div <%--class="button"--%>>
                    <button id="Submit" runat="server" onserverclick="Submit_ServerClick1"> הרשם </button>
                </div>
               <div class="button">
                  <a href="WebForm2.aspx">חזור</a>
               </div>
            </form>
        </div>
    </div>

</body>
</html>

