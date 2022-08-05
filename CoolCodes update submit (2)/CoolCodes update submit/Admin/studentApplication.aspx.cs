using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_studentApplication : System.Web.UI.Page
{
    OdbcConnection conn = new OdbcConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username1"]==null)
        {
            Response.Redirect("Login.aspx");
        }

    }




    protected void idNumber_TextChanged(object sender, EventArgs e)
    {
        checkDetails();

        
    }

    public void checkDetails()
    {
        string select = "select name,surname,email,studentnumber,cellnumber,institutionname FROM usertable u,institution i WHERE idnumber = '" +
            idNumber.Text.ToString() + "'AND u.institutionID = i.institutionID";
        conn.Open();
        
        OdbcDataAdapter adapt = new OdbcDataAdapter(select, conn);
        DataSet dts = new DataSet();
        adapt.Fill(dts);
        DataTable myTable = dts.Tables[0];
        


        if (myTable.Rows.Count > 0)
        {
            foreach (DataRow i in myTable.Rows)
            {

                studNumber.Text = i["studentNumber"].ToString();

                name.Text = i["name"].ToString();
                surname.Text = i["surname"].ToString();
                
                email.Text = i["email"].ToString();
               
                institution.Text = i["institutionName"].ToString();
                cellNumber.Text = i["cellnumber"].ToString();
               
            }
        }
        else
        {
            studNumber.Text = "student number";

            name.Text = "name";
            surname.Text = "surname";

            email.Text ="email";

            institution.Text = "institutionName";
            cellNumber.Text = "cellnumber";
        }
        conn.Close();

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        getResident();
    }
    public void getResident()
    {
        string select = "select year,status,locationcity,residentname from application a, resident r WHERE applicationid = '" +
           DropDownList1.Text.ToString() + "' AND a.residentID = r.residentid";
        conn.Open();

        OdbcDataAdapter adapt = new OdbcDataAdapter(select, conn);
        DataSet dts = new DataSet();
        adapt.Fill(dts);
        DataTable myTable = dts.Tables[0];



        if (myTable.Rows.Count > 0)
        {
            foreach (DataRow i in myTable.Rows)
            {

                year.Text = i["year"].ToString();

                status.Text = i["status"].ToString();
                city.Text = i["locationcity"].ToString();

                resident.Text = i["residentname"].ToString();

               

            }
        }
        conn.Close();
    }

    protected void update_Click(object sender, EventArgs e)
    {
        updateStatus();
    }
    public void updateStatus()
    {
        string update = "UPDATE application SET status = '" + status.Text.ToString() + "'where applicationid = '" + DropDownList1.Text.ToString() + "'";

        conn.Open();
        

        OdbcCommand cmd = new OdbcCommand(update, conn);
        cmd.ExecuteNonQuery();

        conn.Close();
        //Response.Redirect("studentApplication.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        getResident();
    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)

    {
        idNumber.Text = ListBox1.SelectedItem.ToString();
        checkDetails();
        getResident();
    }

    protected void status_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}