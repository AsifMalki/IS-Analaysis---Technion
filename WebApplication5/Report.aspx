<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="WebApplication5.Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <link href="StyleSheet2.css" rel="stylesheet" />
           <h2>בחר סוג נכס שעליו תרצה לדווח:</h2>
             <div class="container2">
              
                <div>
                     <button id="Apartments" runat="server" onserverclick="Apartments_ServerClick"> לדיווח על דירה לחץ כאן </button>
                </div>
                     <div>
                    <button id="Button1" runat="server" onserverclick="Apartments_ServerClick"> לדיווח על שטח לחץ כאן</button>
                </div>
                
                     <div>
               <button id="Button2" runat="server" onserverclick="Apartments_ServerClick">לדיווח על חשבון בנק לחץ כאן</button>
                </div>
                     <div>
                    <button id="Button3" runat="server" onserverclick="Apartments_ServerClick">לדיווח על כספת לחץ כאן</button>
                </div>
                     <div>
                     <button id="Button4" runat="server" onserverclick="Apartments_ServerClick">לדיווח על אחר לחץ כאן</button>
                </div>
        </div>
    </form>
</body>
</html>
