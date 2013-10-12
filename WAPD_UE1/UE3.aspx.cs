using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


namespace WAPD_UE1
{
    public partial class UE3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            
        }

        protected void firstnameCheck(object sender, ServerValidateEventArgs e)
        {
            if (e.Value.Length > 1)
                e.IsValid = true;
            else
                e.IsValid = false;
        }

        protected void goToStep2(object sender, EventArgs e)
        {
            string selectedProduct = product.SelectedItem.Text;
            productToBuy.Text = selectedProduct;
            deliveryDate.Text = Calendar1.SelectedDate.ToString("dd.MMMM.yyyy") + " (" + showExpress.InnerHtml + ")";
            FirstnameVal.Text = Firstname.Text;
            LastnameVal.Text = Lastname.Text;
            StreetVal.Text = Street.Text;
            HouseNoVal.Text = HouseNumber.Text;
            PLZVal.Text = PLZ.Text;
            CityVal.Text = City.Text;
            MailVal.Text = Mail.Text;
        }

        protected void Calendar1_DayRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
        {
            // Select all dates in the past
            if (e.Day.Date < System.DateTime.Today.AddDays(1))
            {
                // Disable date
                e.Day.IsSelectable = false;
                // Change color of disabled date
                e.Cell.ForeColor = Color.Gray;
            }

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime Today = System.DateTime.Today;

            if (Today.DayOfWeek == DayOfWeek.Saturday)
                Today = Today.AddDays(2);
            else if (Today.DayOfWeek == DayOfWeek.Sunday)
                Today = Today.AddDays(1);

            if (Calendar1.SelectedDate < Today.AddDays(2))
                showExpress.InnerHtml = "Expressliefeung";
            else
                showExpress.InnerHtml = "keine Expresslieferung";

        }
    }
}