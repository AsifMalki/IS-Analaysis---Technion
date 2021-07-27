using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace WebApplication5
{
    public partial class ManagerScreen : System.Web.UI.Page
    {
        public SqlConnection conn = new SqlConnection(Connection.connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvbind2();
                gvbind();
               
            }

        }

        protected void gvbind2()
        {

            conn.Open();
            SqlCommand cmd = new SqlCommand("select EmployeeID, FirstName +' '+ LastName as FullName from Employees", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds2 = new DataSet();
            da.Fill(ds2);
            conn.Close();
            if (ds2.Tables[0].Rows.Count > 0)
            {
                Emp.DataSource = ds2;
                Emp.DataBind();
            }
            else
            {
                ds2.Tables[0].Rows.Add(ds2.Tables[0].NewRow());
                Emp.DataSource = ds2;
                Emp.DataBind();
                int columncount = Emp.Rows[0].Cells.Count;
                Emp.Rows[0].Cells.Clear();
                Emp.Rows[0].Cells.Add(new TableCell());
                Emp.Rows[0].Cells[0].ColumnSpan = columncount;
                Emp.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        
            protected void gvbind()
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select CaseReports.ReportID, CaseReports.ReporterID, CaseReports.EmployeeID + ' ' + Employees.FirstName +' '+ Employees.LastName as Employee, CaseReports.AssetType, CaseReports.ReportStatus,CaseReports.ReportDate, CaseReports.Remarks from CaseReports inner join Employees on CaseReports.EmployeeID = Employees.EmployeeID ;" , conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                GridView1.DataSource = ds;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";

            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("ReportID");
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete FROM CaseReports where ReportID='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            gvbind();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gvbind();
        }
        public void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ReportID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            LinkButton lblID = (LinkButton)row.FindControl("ReportID");
            ////TextBox txtname=(TextBox)gr.cell[].control[];  
            //TextBox textName = (TextBox)row.Cells[0].Controls[0];
            //TextBox textadd = (TextBox)row.Cells[1].Controls[0];
            TextBox EmployeeID = (TextBox)row.Cells[2].Controls[0];
            //DropDownList mployeeID = (DropDownList)row.Cells[2].Controls[0];
            
            string id = EmployeeID.Text;
            TextBox Remarks1 = (TextBox)row.Cells[6].Controls[0];
            string Remarks2 = Remarks1.Text;
           
            //TextBox textadd = (TextBox)row.FindControl("txtadd");  
            //TextBox EmployeeID = (TextBox)row.FindControl("EmployeeID");
            GridView1.EditIndex = -1;
            
            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
                 
            {

                SqlCommand cmd = new SqlCommand("update CaseReports set EmployeeID ='" + id + "' where ReportID='" + ReportID + "'", conn);
                SqlCommand cmd2 = new SqlCommand("update CaseReports set Remarks ='" + Remarks2 + "' where ReportID='" + ReportID + "'", conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                conn.Close();
                gvbind();
            }
          
           

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            gvbind();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gvbind();
        }
        
        protected void ReportID_Click(object sender, EventArgs e)
        {
            //GridViewRow grdRow = (GridViewRow)((LinkButton)sender).NamingContainer;
            //LinkButton lnkButton = grdRow.FindControl("ReportID") as LinkButton;
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            LinkButton btn = (LinkButton)(sender);
            
            string ReportID = btn.Text;
          
            string AssetType2 = clickedRow.Cells[4].Text;
            
            if (AssetType2 == "Apartment")
            {
                Response.Redirect("APTView.aspx?Parameter=" + ReportID);
            }
            if (AssetType2 == "SafeBox")
            {
                Response.Redirect("SBView.aspx?Parameter=" + ReportID);
            }
            if (AssetType2 == "Other")
            {
                Response.Redirect("OtherView.aspx?Parameter=" + ReportID);
            }
            if (AssetType2 == "Field")
            {
                Response.Redirect("FieldView.aspx?Parameter=" + ReportID);
            }
            if (AssetType2 == "BankAccount")
            {
                Response.Redirect("BAView.aspx?Parameter=" + ReportID);
            }

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                //Determine the RowIndex of the Row whose LinkButton was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = GridView1.Rows[rowIndex];

                //Fetch value of Name.
                //string name = (row.FindControl("txtName") as TextBox).Text;

                //Fetch value of Country
                string ReportID = (row.FindControl("ReportID") as TextBox).Text;
                              
                string AssetType2 = row.Cells[4].Text;
               

                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name: "  + "\\nCountry: " + ReportID + "');", true);
            }
        }

        protected void Dohot_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Dohot.aspx");
        }

    

        //public void EmployeeID_SelectedIndexChanged(object sender, EventArgs e)
        //{


        //}

        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType==DataControlRowType.DataRow)
        //    {
        //        conn.Open();
        //        DropDownList IDD = (e.Row.FindControl("IDD") as DropDownList);
        //        SqlCommand cmd = new SqlCommand("select Employees.EmployeeID +' '+ Employees.FirstName + ' ' + Employees.LastName as Employee from Employees inner join CaseReports on Employees.EmployeeID = CaseReports.EmployeeID", conn);
        //        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        sda.Fill(dt);
        //        conn.Close();
        //        IDD.DataSource = dt;
        //        IDD.DataTextField = "IDD";
        //        IDD.DataValueField = "IDD";
        //        IDD.DataBind();

        //    }
        //}
    }
}