using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication5
{
    public partial class Apartments : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack==false)
            {

          
            using (SqlConnection con = new SqlConnection(Connection.connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetAllCities", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    //City.Items.Add("בחר עיר");
                    while (rdr.Read())
                    {
                        City.Items.Add(Convert.ToString(rdr[0]));
                    }
                       
                    con.Close();
                }
                        
                    

                }

        }
       
            {

            }
            }
        


       
        public void APTReport_ServerClick(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(Connection.connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("APTReport", con))
                {
                    string ID = Request.QueryString["Parameter"].ToString();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ReporterID", ID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            using (SqlConnection con = new SqlConnection(Connection.connectionString))
            {
                
                //string QID = "select StreetID from [Streets] where StreetName = '@ID'";
                ////string IDQuarey = "select StreetID from streets where StreetName = 'N '" + Streets.SelectedValue + "'";
                SqlCommand cmd2 = new SqlCommand("GetStreetName", con);
                {
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.Add("@StreetName",SqlDbType.NVarChar, 50).Value = Streets.SelectedValue;
                    cmd2.Parameters.Add("@StreetID", SqlDbType.Int);
                    cmd2.Parameters["@StreetID"].Direction = ParameterDirection.Output;//לשאול את שקד
                    con.Open();
                    cmd2.ExecuteNonQuery();
                    int StreetID = Convert.ToInt32(cmd2.Parameters["@StreetID"].Value);
                    con.Close();
                    {
                        using (SqlCommand cmd = new SqlCommand("ApartmentReport", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@CityID", City.SelectedIndex);
                            cmd.Parameters.AddWithValue("@StreetID", StreetID);
                            cmd.Parameters.AddWithValue("@HouseNum", HouseNum.Value);
                            cmd.Parameters.AddWithValue("@ApartmentNum", ApartmentNum.Value);
                            cmd.Parameters.AddWithValue("@PostalCode", PostalCode.Value);
                            cmd.Parameters.AddWithValue("@Owner", Owner.Value);
                            cmd.Parameters.AddWithValue("@Description", Desc.Value);
                            cmd.Parameters.AddWithValue("@Entrance", Entrance.Value);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", "alert(':)הדיווח נקלט בהצלחה, תודה על פנייתך!')", true);
                            string ID = Request.QueryString["Parameter"].ToString();
                            con.Close();

                            //Response.Redirect("Report.aspx?Parameter=" + ID);

                        }
                    }
                }
                
         
            }
        }

        protected void City_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Connection.connectionString))
            using (SqlCommand cmd = new SqlCommand("GetAllStreets", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@CityID", City.SelectedIndex );
                SqlDataReader rdr2 = cmd.ExecuteReader();
                Streets.Items.Clear();
                while (rdr2.Read())
                {
                    Streets.Items.Add(Convert.ToString(rdr2[0]));
                }

                con.Close();
            }

        }
    }
}
