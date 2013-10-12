using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPD_UE1
{
    public partial class Default : System.Web.UI.Page
    {
        
            protected void Page_Load(object sender, EventArgs e)
            {
                if (Page.IsPostBack == true)
                {
                    info_default.InnerHtml = "";
                }
            }

            protected void load_version1(object sender, EventArgs e)
            {

            }
    }
}