using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPD_UE1
{
    public partial class UE1_Version1 : System.Web.UI.Page
    {

            protected void Page_Load(object sender, EventArgs e)
            {
                if (Page.IsPostBack == true)
                {
                    info_v1.InnerHtml = "";
                }
            }



            protected void Submit_ServerClick_v1(object sender, EventArgs e)
            {
                if (Page.IsValid)
                {
                    String firstname = Firstname_v1.Value;
                    String lastname = Lastname_v1.Value;

                    String gender = "";
                    if (Male_v1.Checked) gender = "Herr";
                    else gender = "Frau";

                    String mail = Mail_v1.Value;

                    String message = "Sehr geehrte";
                    message += gender == "Herr" ? "r " : " ";
                    message += gender + " " + firstname + " " + lastname + ",<br /> wir weden Sie in k&uuml;rze unter \"" + mail + "\" kontaktieren!<br />Mit freundlichen Gr&uuml;&szlig;en, Wir!";

                    Output_v1.InnerHtml = message + "<style type=\"text/css\">#Output_v1{background-color: lightcoral;width: 407px;margin-top: -60px;margin-left: 20px;padding: 15px;}</style>";
                }
            }
    }
}