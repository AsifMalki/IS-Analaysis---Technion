using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Apartments_ServerClick(object sender, EventArgs e)
        {
            string ID = Request.QueryString["Parameter"].ToString();
            //string name = "select FirstName + ' ' + LastName as fullname from Reporter where ReporterID = '" + ID + "'";
            Response.Redirect("Apartments.aspx?Parameter=" + ID);
        }
    }
}