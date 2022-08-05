using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["username1"] = null;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(username.Text=="Admin"&&password.Text=="Online@123")
        {
            Session["username1"] = "Admin";
            Response.Redirect("studentApplication.aspx");
        }
        else
        {
            error.Text = "account is not valid try again";
        }
    }
}