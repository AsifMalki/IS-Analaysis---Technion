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
    public partial class Form1 : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection(Connection.connectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                refreshdata();
            }
        }

        public void refreshdata()
        {

            

            con.Open();
            SqlCommand cmd = new SqlCommand("select CaseReports.ReportID, CaseReports.ReporterID, CaseReports.EmployeeID , CaseReports.AssetType, CaseReports.ReportStatus,CaseReports.ReportDate, CaseReports.Remarks from CaseReports  ;", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView2.DataSource = ds;
                GridView2.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                GridView2.DataSource = ds;
                GridView2.DataBind();
                int columncount = GridView2.Rows[0].Cells.Count;
                GridView2.Rows[0].Cells.Clear();
                GridView2.Rows[0].Cells.Add(new TableCell());
                GridView2.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView2.Rows[0].Cells[0].Text = "No Records Found";

            }
        }

        public DataTable GetData(SqlCommand cmd)
        {

            using (SqlConnection con = new SqlConnection(Connection.connectionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }




        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowState == DataControlRowState.Edit)
            {
                //using (SqlConnection con = new SqlConnection(Connection.connectionString))
                //    con.Open();
               
                ////string quary = "select EmployeeID from Employees";
                ////SqlCommand cmd = new SqlCommand(quary);

                using (SqlConnection con = new SqlConnection(Connection.connectionString))
                {
                    using (SqlCommand cmd2 = new SqlCommand("GetAllEmployees", con))
                    {
                        DropDownList DropDownList1 = ((DropDownList)e.Row.FindControl("DropDownList1"));
                        cmd2.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        SqlDataReader rdr = cmd2.ExecuteReader();
                        //City.Items.Add("בחר עיר");
                        while (rdr.Read())
                        {
                            DropDownList1.Items.Add(Convert.ToString(rdr[0]));
                        }
                        DataTable dt = GetData(cmd2);
                        DropDownList1.DataSource = dt;
                        DropDownList1.DataTextField = "EmployeeID";
                        DropDownList1.DataValueField = "EmployeeID";
                        DropDownList1.DataBind();
                        DropDownList1.Items.Insert(0, new ListItem("--Select Employee--", "0"));
                        con.Close();
                    }

                  
                    //SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    //DataTable dt = new DataTable();
                    //sda.Fill(dt);
                    //con.Close();
                    //DropDownList1.DataSource = dt;

                    //City.Items.Add("בחר עיר");



                    //DropDownList1.DataTextField = "EmployeeID";
                    ////DropDownList1.DataValueField = "EmployeeID";
                    ////DropDownList1.DataBind();
         
                    //con.Close();
                }
            }
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            refreshdata();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            refreshdata();
        }

        public void DataRefresh(string Query)
        {

            
            {
                con.Open();
                using (SqlCommand comm = new SqlCommand(Query + "select CaseReports.ReportID, CaseReports.ReporterID, CaseReports.EmployeeID , CaseReports.AssetType, CaseReports.ReportStatus,CaseReports.ReportDate, CaseReports.Remarks from CaseReports  ;", con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(comm);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView2.DataSource = ds;
                    GridView2.DataBind();
                }
            }
        }
                
        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ReportID = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView2.Rows[e.RowIndex];
            Label lblID = (Label)row.FindControl("ReportID");
            ////TextBox txtname=(TextBox)gr.cell[].control[];  
            //TextBox textName = (TextBox)row.Cells[0].Controls[0];
            //TextBox textadd = (TextBox)row.Cells[1].Controls[0];
            DropDownList EmployeeID = (DropDownList)row.Cells[2].Controls[0];
            string id = EmployeeID.Text;
            //TextBox textadd = (TextBox)row.FindControl("txtadd");  
            //TextBox EmployeeID = (TextBox)row.FindControl("EmployeeID");
            
            //con.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
            string updatequary = string.Format("update CaseReports set EmployeeID ='" + id + "'where ReportID='" + ReportID + "'");
            //SqlCommand cmd = new SqlCommand("update CaseReports set EmployeeID ='" + id + "'where ReportID='" + ReportID + "'", con);
            //cmd.ExecuteNonQuery();
            //con.Close();
            GridView2.EditIndex = -1;
            DataRefresh(updatequary);
            //GridView1.DataBind(); 
        }

        protected void GridView2_PageIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            refreshdata();
        }
    }
}