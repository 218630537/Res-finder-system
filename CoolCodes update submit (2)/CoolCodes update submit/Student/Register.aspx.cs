using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Register : System.Web.UI.Page
{
    OdbcConnection conn = new OdbcConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (emailReg.Visible == true)
        {
            Button1.Enabled = false;

        }
        else
        {
            Button1.Enabled = true;
        }

        if(regID.Visible==true)
        {
            Button1.Enabled = false;
        }
        else
        {
            Button1.Enabled = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
        register();
    }
    public void register()
    {
        conn.Open();
        string sqlConnect = "INSERT INTO usertable (name,surname,iDNumber,email,studentNumber, InstitutionID,cellNumber,password) Values('" +name.Text.ToString()+"','"+
        surname.Text.ToString() + "','" + idnumber.Text.ToString() + "','"+email.Text.ToString().ToUpper()+"','"+studNumber.Text.ToString()+"','" + 
        institutionID.Text.ToString() + "','" + cellNumber.Text.ToString() + "','" + password.Text.ToString()+"')";

        OdbcCommand cmd = new OdbcCommand(sqlConnect, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("login.aspx");

        conn.Close();
    }
    public void checkID()
    {
        string select = "select idnumber from usertable where idnumber ='" + idnumber.Text + "'";
        OdbcDataAdapter adapt = new OdbcDataAdapter(select, conn);
        DataSet dts = new DataSet();
        adapt.Fill(dts);
        DataTable myTable = dts.Tables[0];
        string studNum = null;


        if (myTable.Rows.Count > 0)
        {
            regID.Visible = true;
            Button1.Enabled = false;
        }
        else
        {
            regID.Visible = false;
            Button1.Enabled = true;
        }
       

    }
    public void CheckEmail()
    {

    }
    public void checkEmail()
    {
        string select = "select email from usertable where email ='" + email.Text.ToUpper() + "'";
        OdbcDataAdapter adapt = new OdbcDataAdapter(select, conn);
        DataSet dts = new DataSet();
        adapt.Fill(dts);
        DataTable myTable = dts.Tables[0];
        string studNum = null;


        if (myTable.Rows.Count > 0)
        {
            emailReg.Visible = true;
            Button1.Enabled = false;
        }
        else
        {
            emailReg.Visible = false;
            Button1.Enabled = true;
        }
    }

    protected void idnumber_TextChanged(object sender, EventArgs e)
    {
        checkID();
      
    }

    protected void email_TextChanged(object sender, EventArgs e)
    {
        checkEmail();
        
    }
}