using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
namespace WebApplication5
{
    public partial class APTViewInv : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //string Connection = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;

                using (SqlConnection con = new SqlConnection(Connection.connectionString))
                {
                    string ReportID = Request.QueryString["Parameter"].ToString();
                    using (SqlCommand cmd = new SqlCommand("SELECT Apartments.ReportID, Cities.CityName, Streets.StreetName, Apartments.HouseNum, Apartments.Entrance, Apartments.ApartmentNum, Apartments.PostalCode, Apartments.Owner, Apartments.Description FROM Apartments inner join Streets on Apartments.StreetID = Streets.StreetID inner join Cities on Apartments.CityID=Cities.CityID WHERE Apartments.ReportID ='" + ReportID + "'"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();

                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        //Reasult= sdrcmd.ExecuteReader().
                        {
                            sdr.Read();
                            TextBox1.Text = Convert.ToString(sdr["ReportID"]);
                            City.Text = Convert.ToString(sdr["CityName"]);
                            Street.Text = Convert.ToString(sdr["StreetName"]);
                            Housenum.Text = Convert.ToString(sdr["HouseNum"]);
                            TextBox2.Text = Convert.ToString(sdr["Entrance"]);
                            TextBox3.Text = Convert.ToString(sdr["ApartmentNum"]);
                            TextBox4.Text = Convert.ToString(sdr["PostalCode"]);
                            TextBox5.Text = Convert.ToString(sdr["Owner"]);
                            TextBox6.Text = Convert.ToString(sdr["Description"]);


                        }
                        con.Close();
                    }
                }
            }

        }

        public void Dohot_ServerClick(object sender, EventArgs e)
        {
            string ID = Request.QueryString["Parameter2"].ToString();
            Response.Redirect("InvestigaitorLogin.aspx?Parameter2=" + ID);
        }
    }
}