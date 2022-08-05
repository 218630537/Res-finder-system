using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        checkSession();
        

    }

    protected void Register_Click(object sender, EventArgs e)
    {

    }
    public void checkSession()
    {
        if (Session["username"] == null)
        {
            Register.Visible = true;
            
            Logout.Visible = false;
            
            Apply.Visible = false;
            viewApp.Visible = false;
        }
        else
        {
            Register.Visible = false;
           // usernam.Text = "welcome "+ Session["username"].ToString();
            Login.Visible = false;
            //usernam.Visible = true;
            Logout.Visible = true;
            viewApp.Visible = true;
            Apply.Visible = true;

            if (Session["apply"] != null)
            {

                Apply.Visible = false;
            }
            else
            {
                Apply.Visible = true;
            }
            if (Session["view"] != null)
            {

                viewApp.Visible = false;
            }
            else
            {
                viewApp.Visible = true;
            }
        }
    }
    protected void Login_Click(object sender, EventArgs e)
    {
       

    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        

    }
}
