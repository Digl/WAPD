using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPD_UE1
{
    public partial class UE1_Version2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (Page.IsPostBack == true)
            {
                info_v2.InnerHtml = "";
            }
            //ScriptResourceDefinition jquery = new ScriptResourceDefinition();
            //jquery.Path = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.7.2.min.js";    
            
            
        }

        protected void firstnameCheck(object sender, ServerValidateEventArgs e)
        {
            if (e.Value.Length > 1)
                e.IsValid = true;
            else
                e.IsValid = false;
        }

        protected void Submit_Click_v2(object sender, EventArgs e)
        {
            String firstname = Firstname_v2.Text;
            String lastname = Lastname_v2.Text;

            String gender = "";
            if (Male_v2.Checked) gender = "Herr";
            else gender = "Frau";

            String mail = Mail_v2.Text;

            String message = "Sehr geehrte";
            message += gender == "Herr" ? "r " : " ";
            message += gender + " " + firstname + " " + lastname + ",<br /> wir weden Sie in k&uuml;rze unter \"" + mail + "\" kontaktieren!<br />Mit freundlichen Gr&uuml;&szlig;en, Wir!";


            Output_v2.InnerHtml = message + "<style type=\"text/css\">#Output_v2{background-color: lightgreen;width: 407px;margin-top: -60px;margin-left: 20px;padding: 15px;}</style>";
        }
    }
}