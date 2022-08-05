using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_apply : System.Web.UI.Page
{
    OdbcConnection conn = new OdbcConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        Session["apply"] = "1";
        Session["view"] = null;


        if (Session["username"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        name.Text = Session["name"].ToString();
        surname.Text = Session["surname"].ToString();
        studNumber.Text = Session["username"].ToString();
        email.Text = Session["email"].ToString();
        institution.Text = Session["institutionName"].ToString();
        idnumber.Text = Session["idnumber"].ToString();
        cellNumber.Text = Session["cellnumber"].ToString();



    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        checkinfor();
    }
    public void checkinfor()
    {
        conn.Open();
        string select = "select * from application where idnumber='" + idnumber.Text.ToString() + "' and year = '" + yearInput.Text.ToString() + "' And residentID='"
            + ResidentName.Text.ToString() + "'";



        OdbcDataAdapter adapt = new OdbcDataAdapter(select, conn);
        DataSet dts = new DataSet();
        adapt.Fill(dts);
        DataTable myTable = dts.Tables[0];



        if (myTable.Rows.Count > 0)
        {
            error.Visible = true;
            //foreach (DataRow i in myTable.Rows)
            //{

            //}

        }
        else
        {
            conn.Close();
            insert();
        }

    }
    public void insert()
    {

        conn.Open();
        string insertTo = "insert into application (idnumber, year, residentID) VALUES('" + idnumber.Text.ToString() + "','" + yearInput.Text.ToString()
            + "'," + "'" + ResidentName.Text.ToString() + "')";

        OdbcCommand cmd = new OdbcCommand(insertTo, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("ViewApplication.aspx");


    }

    protected void ress_SelectedIndexChanged(object sender, EventArgs e)
    {
        //conn.Open();
        //string insertTo = " Select residentID from resident where residentName = '"+"'";

        //OdbcCommand cmd = new OdbcCommand(insertTo, conn);
        //cmd.ExecuteNonQuery();
        //conn.Close();

        //conn.Close();
    }

    protected void ResidentName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string temp = "1637559824672.png";

        conn.Open();
        string select = "select picture from resident where residentID ='" + ResidentName.Text.ToString() + "'";



        OdbcDataAdapter adapt = new OdbcDataAdapter(select, conn);
        DataSet dts = new DataSet();
        adapt.Fill(dts);
        DataTable myTable = dts.Tables[0];



        if (myTable.Rows.Count > 0)
        {
            foreach (DataRow i in myTable.Rows)
            {
                temp = i["picture"].ToString();
            }
        }

        // Image1.ImageUrl = "..\\Common\\images\\"+ temp;
        Image1.ImageUrl = "~/Common/images/" + temp;
        Image1.Visible = true;
        conn.Close();
    }
}