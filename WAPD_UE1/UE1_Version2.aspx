<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UE1_Version2.aspx.cs" Inherits="WAPD_UE1.UE1_Version2"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="WAPD_style.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.microsoft.com/ajax/jQuery/jquery-1.7.2.min.js" type="text/javascript"></script>
    <title></title>
</head>
<body>
    <div id="wrapper" style="margin:40px;">
        <h1>Kontakt-Formular v.2</h1>
        <div runat="server" id="info_v2">Kontaktieren Sie uns &uuml;ber unser Kontaktformular:</div>

    

       <form id="contactForm_v2" runat="server">
            <asp:Table  style="margin: 20px; background-color: lightgray;" runat="server">
                <asp:TableRow>
                    <asp:TableCell>Vorname:</asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="Firstname_v2" runat="server"></asp:TextBox></asp:TableCell> 
                    <asp:TableCell><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Firstname_v2" Text="*" runat="server"
                ErrorMessage="Vorname" /></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Nachname:</asp:TableCell> 
                    <asp:TableCell><asp:TextBox ID="Lastname_v2" runat="server"></asp:TextBox></asp:TableCell> 
                    <asp:TableCell><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Lastname_v2" Text="*" runat="server"
                ErrorMessage="Nachname" /></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Geschlecht:</asp:TableCell> 
                    <asp:TableCell><asp:RadioButton ID="Male_v2" Checked="true" runat="server" GroupName="gender" Text=" m&auml;nnlich " />
                    <asp:RadioButton ID="Female_v2" Checked="false" runat="server" GroupName="gender" Text=" weiblich" /></asp:TableCell> 
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>Geburtsjahr:</asp:TableCell> 
                    <asp:TableCell><asp:TextBox ID="Age_v2" runat="server"></asp:TextBox></asp:TableCell> 
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>E-Mail:</asp:TableCell> 
                    <asp:TableCell><asp:TextBox ID="Mail_v2" runat="server"></asp:TextBox></asp:TableCell> 
                    <asp:TableCell><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Mail_v2" Text="*" runat="server"
                ErrorMessage="Emailadresse" /></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>repeat E-Mail:</asp:TableCell> 
                    <asp:TableCell><asp:TextBox ID="repeatMail_v2" runat="server"></asp:TextBox></asp:TableCell> 
                    <asp:TableCell><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="repeatMail_v2" Text="*" runat="server"
                ErrorMessage="Emailadresse wiederholen" /></asp:TableCell>
                </asp:TableRow>
                


                <asp:TableRow>
                    <asp:TableCell><asp:Button ID="Submit_v2" runat="server" Text="Submit Form" OnClick="Submit_Click_v2"/></asp:TableCell> 
                </asp:TableRow>
            </asp:Table>   
           <br /><br />


           <asp:Table runat="server" ID="errorMessages">
               <asp:TableRow>
                   <asp:TableCell>
                       <asp:CustomValidator runat="server" id="cusCustom" EnableClientScript="true" ClientValidationFunction="firstnameCheck_Client"
                           CssClass="errorCheck" ControlToValidate="Firstname_v2" OnServerValidate="firstnameCheck" 
                           Text="Der Vorname muss mindestens zwei Zeichen lang sein!" ErrorMessage="Vorname" />
                   </asp:TableCell>
               </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>
                       <asp:RangeValidator id="ageCheck" CssClass="errorCheck" runat="server" ErrorMessage="Das Geburtsjahr darf nicht in der Zukunft liegen!" Display="Dynamic" 
               ControlToValidate="Age_v2" MinimumValue="1900" MaximumValue="2013" Type="Integer" ></asp:RangeValidator>
                   </asp:TableCell>
               </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>
                       <asp:RegularExpressionValidator ID="regexEmailValid" CssClass="errorCheck" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                           ControlToValidate="Mail_v2" ErrorMessage="Die eingegebene Emailadresse hat ein ung&uuml;ltiges Email Format"></asp:RegularExpressionValidator>
                   </asp:TableCell>
               </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>
                       <asp:CompareValidator id="mailCheck" CssClass="errorCheck" runat="server" ErrorMessage="Die eingegebenen Emailadressen stimmen nicht &uuml;berein." Display="Dynamic" 
               ControlToCompare="Mail_v2" Type="String" ControlToValidate="repeatMail_v2"></asp:CompareValidator>
                   </asp:TableCell>
               </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>
                       <asp:ValidationSummary ID="ValidationSummary1" CssClass="errorCheck" HeaderText="<br />Sie m&uuml;ssen noch folgende Felder ausf&uuml;llen:" DisplayMode="BulletList" 
               EnableClientScript="true" runat="server" />
                   </asp:TableCell>
               </asp:TableRow>
           </asp:Table>
           <script type="text/javascript">
               setInterval(function () {
                       var ok = true;
                       $(".errorCheck").each(function () {
                           if ($(this).css("display") != "none" && $(this).css("visibility") != "hidden") {
                               ok = false;
                               return false;
                           }
                       });
                       if (!ok)
                           jQuery('#errorMessages').show();
                       else
                           jQuery('#errorMessages').hide();
               }, 500);

               function firstnameCheck_Client(sender, e)
               {
                if (e.Value.Length > 1)
                   e.IsValid = true;
                else
                   e.IsValid = false;
               }

        </script>
        </form>
        <br />
        <br />

        <div id="Output_v2" runat="server">
            Nothing submitted yet!
        </div>
    
        <br />
        <br />
        <a href="Default.aspx">Back to Menu</a>
    </div>
</body>
</html>
