using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace WebApplication5
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

     

        protected void Submit_ServerClick1(object sender, EventArgs e)
        {


            if (Pass.Value == Pass2.Value)
            {
                using (SqlConnection con = new SqlConnection(Connection.connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("Register", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ReporterID", ID_txt.Value);
                        cmd.Parameters.AddWithValue("@FirstName", FirstName.Value);
                        cmd.Parameters.AddWithValue("@LastName", LastName.Value);
                        cmd.Parameters.AddWithValue("@ReporterMail", ReporterMail.Value);
                        cmd.Parameters.AddWithValue("@ReporterPhone", ReporterPhone.Value);
                        cmd.Parameters.AddWithValue("@ReporterPassword", Pass.Value);
                        cmd.Parameters.AddWithValue("@BirthDate", BDate.Value);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", "alert('Registered')", true);

                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", "alert('Password dont match')", true);

            }
        }
    }
}