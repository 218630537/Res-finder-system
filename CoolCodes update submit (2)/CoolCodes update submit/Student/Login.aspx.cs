using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Login : System.Web.UI.Page
{
    OdbcConnection conn = new OdbcConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["username"] = null;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        login();
    }
    public void login()
    {
     
        conn.Open();
        string select = "select name, surname, idnumber, email, studentnumber, institutionName,usertable.institutionID instID,cellnumber from usertable, institution WHERE email = '" +
            username.Text.ToString().ToUpper() + "'AND usertable.institutionID = institution.institutionID AND password = '" + password.Text.ToString() + "'";
        OdbcDataAdapter adapt = new OdbcDataAdapter(select, conn);
        DataSet dts = new DataSet();
        adapt.Fill(dts);
        DataTable myTable = dts.Tables[0];
        string studNum = null;
         

        if (myTable.Rows.Count > 0)
        {
            foreach (DataRow i in myTable.Rows)
            {

                studNum = i["studentNumber"].ToString();

                Session["name"] = i["name"].ToString();
                Session["surname"]=i["surname"].ToString();
                Session["idnumber"] = i["idnumber"].ToString();
                Session["email"] = i["email"].ToString();
                Session["instID"] = i["instID"].ToString();
                Session["institutionName"] = i["institutionName"].ToString();
                Session["cellnumber"] = i["cellnumber"].ToString();
               // Session["institutionID"] = i["institution.institutionID"].ToString();
            }

            Session["username"] = studNum;
           

            Response.Redirect("ViewApplication.aspx");
            Session["apply"] = "1";

        }
        else
        {
            error.Text = "account is not valid try again";
        }
        conn.Close();
    }
        
    }