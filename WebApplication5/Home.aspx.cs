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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
    
        }

        public  void Login_ServerClick(object sender, EventArgs e)
        {
            
            using (SqlConnection con = new SqlConnection(Connection.connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("RepLogin", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ReporterID", ID_Login.Value);
                    cmd.Parameters.AddWithValue("@ReporterPassword", Pass_login.Value);
                    cmd.Parameters.Add("@fullName", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@fullName"].Direction = ParameterDirection.Output;
                    //cmd.Parameters.Add("@mail", SqlDbType.NVarChar, 50);
                    //cmd.Parameters[3].Direction = ParameterDirection.Output;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    if (cmd.Parameters["@fullname"].Value == DBNull.Value)
                    {
                        
                        using (SqlCommand cmd2 = new SqlCommand("EmpLogin", con))
                        {
                            cmd2.CommandType = CommandType.StoredProcedure;
                            cmd2.Parameters.AddWithValue("@ID", ID_Login.Value);
                            cmd2.Parameters.AddWithValue("@Password", Pass_login.Value);
                            cmd2.Parameters.Add("@fullName", SqlDbType.NVarChar, 50);
                            cmd2.Parameters["@fullName"].Direction = ParameterDirection.Output;
                            cmd2.Parameters.Add("@mail", SqlDbType.NVarChar, 50);
                            cmd2.Parameters[3].Direction = ParameterDirection.Output;
                            cmd2.Parameters.Add("@EmployeeType", SqlDbType.NChar, 1);
                            cmd2.Parameters["@EmployeeType"].Direction = ParameterDirection.Output;
                            cmd2.ExecuteNonQuery();
                            if (cmd2.Parameters["@fullname"].Value == DBNull.Value)
                            {
                                div_err.Style.Add(HtmlTextWriterStyle.Display, "block");
                            }
                            
                            else
                            {
                                
                                if (Convert.ToChar(cmd2.Parameters["@EmployeeType"] .Value) == 'I')
                                {
                                    Response.Redirect("InvestigaitorLogin.aspx");
                                }
                                else
                                {
                                    Response.Redirect("ManagerScreen.aspx");
                                }

                            }
                        }
                    }
                    else
                    {

                        string ID = ID_Login.Value;
                        con.Close();
                        Response.Redirect("Report.aspx?Parameter=" + ID);
                        
                    }
                       
                    
                }
                    
                
            }
        }
    }
}
