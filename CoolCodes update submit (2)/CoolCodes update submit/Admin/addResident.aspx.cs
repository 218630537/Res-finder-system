using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;

public partial class Admin_sddResident : System.Web.UI.Page
{
    OdbcConnection conn = new OdbcConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username1"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       // ressImage.EnableViewState = true;
        addRess();
    }
    public void addRess()
    {
        string select = "select * from resident where residentname ='" + ressName.Text.ToString().ToUpper() + "'";

        conn.Open();
        OdbcDataAdapter adapt = new OdbcDataAdapter(select, conn);
        DataSet dts = new DataSet();
        adapt.Fill(dts);
        DataTable myTable = dts.Tables[0];
        if (myTable.Rows.Count > 0)
        {
            error1.Text = "Resident already exist";
        }
        else
        {
            //    select = "Select institutionID from institution where institutionname ='" + DropDownList1.DataTextField.ToString() + "'";

            //    string temp = DropDownList1.DataTextField.ToString();
            // adapt = new OdbcDataAdapter(select, conn);
            // dts = new DataSet();
            //adapt.Fill(dts);
            // myTable = dts.Tables[0];
            // if (myTable.Rows.Count > 0)
            // {
            //     temp = "1235";
            //       foreach (DataRow i in myTable.Rows)
            //    {
            //        temp = i["institutionID"].ToString();
            //     }
            // }
            // string number11 = (DropDownList1.DataValueField.ToString());

            string temp = Session["filename"].ToString();
            string insert = "INSERT INTO resident (residentName,institutionID,locationCity,picture) values ( '"+ressName.Text.ToString().ToUpper()+"','"
        + DropDownList1.Text.ToString() + "','" + ressTown.Text.ToString()+ "','" + temp+ "')";

            OdbcCommand cmd = new OdbcCommand(insert, conn);
            cmd.ExecuteNonQuery();

            error1.Text = "Resident added ";
           
        }
        conn.Close();

    }

    protected void btnUpload_Click1(object sender, EventArgs e)
    {
        string strFileName;
        string strFilePath;
        string strFolder;
        strFolder = Server.MapPath("../common/images/");
        // Retrieve the name of the file that is posted.
        strFileName = oFile.PostedFile.FileName;
        strFileName = Path.GetFileName(strFileName);
        if (oFile.Value != "")
        {
            // Create the folder if it does not exist.
            if (!Directory.Exists(strFolder))
            {
                Directory.CreateDirectory(strFolder);
            }
            // Save the uploaded file to the server.
            strFilePath = strFolder + strFileName;
            if (File.Exists(strFilePath))
            {
                lblUploadResult.Text = strFileName + " already exists on the server!";
            }
            else
            {
                Session["filename"] = strFileName.ToString();
                oFile.PostedFile.SaveAs(strFilePath);
                lblUploadResult.Text = strFileName + " has been successfully uploaded.";
                Button1.Visible = true;
            }
        }
        else
        {
            lblUploadResult.Text = "Click 'Browse' to select the file to upload.";
        }
        // Display the result of the upload.
        frmConfirmation.Visible = true;
    }
}