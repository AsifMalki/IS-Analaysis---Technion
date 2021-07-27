<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication5.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
      <link href="Style.css" rel="stylesheet" />
</head >

<body  class="body">
       <form id="form1" runat="server"> 
   
   
        <div class="container">
        <nav class="navbar" >
            <ul>
                <li><a href="#home">כניסה למערכת</a></li>
                <li><a href="#about">מי אנחנו</a></li>
                <li><a href="#service">שירות</a></li>
                <li><a href="#contact">צור קשר</a></li>

            </ul>
        </nav  >
       
       <section id="home" <%--style= "margin-top:200px"--%>>
         
            <h1>התחברות למערכת</h1>

            <div class="user-details">
                <div class="lead"style="direction: rtl;">
                    <div >
                        <span class="details">תעודת זהות</span>
                    </div>
                    <div >
                        <input type="number" placeholder="הכנס תעודת זהות" id="ID_Login" runat="server" required>
                    </div>
                    <div >
                        <span class="details">ססמא</span>
                    </div>
                    <div >
                        <input type="text" placeholder="הכנס ססמא" id="Pass_login" runat="server" required>
                    </div>
                </div>
               <div style="color:red;display:none" id="div_err" runat="server">
            שם משתמש או סיסמא לא תקינים
        

                    
                </div>
           
                <div>
                    <button id="Login" runat="server" onserverclick="Login_ServerClick">התחבר</button>
                                      </div>
                <div>
                    <a href="Register.aspx">הרשמה למערכת</a>
                </div>
                   
                </div>
        
                </section>
        <section id="about" <%--style= "margin-top:200px"--%>>
            <h1>מי אנחנו </h1>
            <p class="lead">               
    מערכת זו היא מערכת לדיווח נכסים ללא בעלים לכאורה ביחידה לאיתור נכסים עזובים ולהשבתם במשרד האפוטרופוס הכללי והממונה על תהליכי חדלות פירעון במשרד המשפטים .משרד המשפטים הוא המשרד הממשלתי האמון על עשיית צדק ושירות הציבור בתחומי המשפט של מדינת ישראל.
    בתוך שירותים אלו, נכללת גם פעילות היחידה לאיתור נכסים עזובים ולהשבתם במשרד האפוטרופוס הכללי והממונה על תהליכי חדלות פרעון במשרד המשפטים. היחידה מקבלת דיווחים על חשד לנכס עזוב, מבצעת פעולות לאיתור בעלי הרכוש או היורשים ומנהלת נכסים עזובים מכוח החוק. ניהול הנכס מסתיים עם השבת הנכסים לזכאים ובתום תקופת הניהול שקבועה בחוק, מועבר הרכוש לקניין המדינה.
    נכון לרגע זה, קיים צורך לשפר את יכולות היחידה בביצוע תהליך קבלת הדיווחים, טיפולם וניהולם ע''י הגורמים הרלוונטיים ביחידה באופן יעיל. זאת על מנת לאפשר דיווח דיגיטלי נגיש שיגדיל את כמות הדיווחים ומתן כלי לבקרה ומעקב בתוך היחידה.
    בנוסף המערכת תכלול ממשק ידידותי למשתמש, אשר מיועד לעודד נגישות לדיווח בשונה מהמצב הקיים. כמו כן המערכת תתממשק למערכת BI שתשמש ככלי למנהלים לגיבוש תמונת מצב עדכנית אודות נתונים נדרשים.
</p>
        </section>
        <section id="service" style= <%--"margin-top:200px"--%>>
            <h1>Service</h1>
            <p class="lead">אהלן מה המצב?</p>
        </section>
        <section id="contact" style= <%--"margin-top:200px"--%>>
            <h1>Contact</h1>
            <p class="lead">אהלן מה המצב?</p>
        </section>
     
             </div>
            </form>
</body>
</html>
