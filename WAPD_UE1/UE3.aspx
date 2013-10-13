<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UE3.aspx.cs" Inherits="WAPD_UE1.UE3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="WAPD_style.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.microsoft.com/ajax/jQuery/jquery-1.7.2.min.js" type="text/javascript"></script>
<title>Bestellformular</title>
</head>
<body>
    <div id="navcontainer">
        <ul id="navlist">
            <li><a href="UE1_Version1.aspx">&nbsp;&nbsp;&Uuml;bung 1 - Version 1&nbsp;&nbsp;</a></li>
            <li><a href="UE1_Version2.aspx">&nbsp;&nbsp;&Uuml;bung 1 - Version 2&nbsp;&nbsp;</a></li>
            <li><a href="UE1_Version2.aspx">&nbsp;&nbsp;&Uuml;bung 2&nbsp;&nbsp;</a></li>
            <li id="active"><a id="current" href="UE3.aspx">&nbsp;&nbsp;&Uuml;bung 3&nbsp;&nbsp;</a></li>
            <li><a href="#">&nbsp;&nbsp;&Uuml;bung 4&nbsp;&nbsp;</a></li>
        </ul>
    </div>
    <div style="clear:both;"></div>
    <br />
    <div id="content">
        <form id="form1" runat="server">
            <div>
                <asp:AdRotator ID="AdRotator1" AdvertisementFile="~/Advertisement.xml" Target="_blank" runat="server" />
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <asp:Image ImageUrl="/images/Step1.png" runat="server" />
                        <asp:Table ID="checkTable2" runat="server" CellSpacing="10">
                            <asp:TableRow>
                                <asp:TableCell>
                                    Produkt ausw&auml;hlen:
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:DropDownList ID="product" runat="server">
                                    <asp:ListItem>Fernseher</asp:ListItem>
                                    <asp:ListItem>Kaffemaschine</asp:ListItem>
                                    <asp:ListItem>PS4</asp:ListItem>
                                    <asp:ListItem>Laptop</asp:ListItem>
                                    <asp:ListItem>Monitor</asp:ListItem>
                                    <asp:ListItem>Internet</asp:ListItem>
                                    <asp:ListItem>Xbox</asp:ListItem>
                                    <asp:ListItem>Freizeit</asp:ListItem>
                                    <asp:ListItem>Maus</asp:ListItem>
                                    <asp:ListItem>Keyboard</asp:ListItem>
                                    <asp:ListItem>Katze</asp:ListItem>
                                    <asp:ListItem>Kabel</asp:ListItem>
                                    <asp:ListItem>Sessel</asp:ListItem>
                                    <asp:ListItem>Webcam</asp:ListItem>
                                    <asp:ListItem>Kopfh&ouml;hrer</asp:ListItem>
                                    <asp:ListItem>Microfon</asp:ListItem>
                                    </asp:DropDownList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Vorname:</asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="Firstname" runat="server"></asp:TextBox></asp:TableCell> 
                            </asp:TableRow>
                             <asp:TableRow>
                                <asp:TableCell>Nachname:</asp:TableCell> 
                                <asp:TableCell><asp:TextBox ID="Lastname" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                    <asp:TableCell>E-Mail:</asp:TableCell> 
                                    <asp:TableCell><asp:TextBox ID="Mail" runat="server"></asp:TextBox></asp:TableCell> 
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>E-Mail wiederholen:</asp:TableCell> 
                                <asp:TableCell><asp:TextBox ID="repeatMail" runat="server"></asp:TextBox></asp:TableCell> 
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Lieferadresse:</asp:TableCell> 
                                <asp:TableCell><asp:TextBox ID="Street" placeholder="Stra&szlig;e" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="HouseNumber" placeholder="Hausnummer" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="PLZ" placeholder="Postleitzahl" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="City" placeholder="Stadt" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    W&auml;hlen Sie Ihren gew&uuml;nschten Liefertermin:
                                </asp:TableCell>
                                <asp:TableCell>
                                    <a id="showExpress" runat="server"></a>
                                </asp:TableCell>
                                </asp:TableRow>
                        </asp:Table>
                        <asp:Calendar ID="Calendar1" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" runat="server"></asp:Calendar>
                        <asp:Button runat="server" ID="Button2" OnClick="goToStep2" CommandName="NextView" Text="Weiter" CausesValidation="false" />

                        

                    </asp:View>

                    <asp:View ID="View2" runat="server">
                     <asp:Image ID="Image1" ImageUrl="/images/Step2.png" runat="server" />
                        <asp:Table runat="server" ID="errorMessages">
                            <asp:TableRow>
                                 <asp:TableCell>
                                     Bitte gehen Sie einen Schritt zur&uuml;ck und l&ouml;sen Sie folgende Probleme:
                                 </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:CustomValidator runat="server" id="cusCustom" EnableClientScript="false" ControlToValidate="Firstname" OnServerValidate="firstnameCheck" CssClass="errorCheck"
                                        Text="Der Vorname muss mindestens zwei Zeichen lang sein!" ErrorMessage="Vorname" ValidationGroup="showValOn2" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                 <asp:TableCell>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator" CssClass="errorCheck" ControlToValidate="Mail" Text="Die Emailaddresse muss eingetragen werden" runat="server"
                                     ErrorMessage="Emailadresse" ValidationGroup="showValOn2" />
                                 </asp:TableCell>
                            </asp:TableRow>
                             <asp:TableRow>
                                 <asp:TableCell>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="errorCheck" ControlToValidate="Street" Text="Die Stra&szlig;e muss eingetragen werden" runat="server"
                                     ErrorMessage="Stra&szlig;e" ValidationGroup="showValOn2" />
                                 </asp:TableCell>
                            </asp:TableRow>
                             <asp:TableRow>
                                 <asp:TableCell>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="errorCheck" ControlToValidate="HouseNumber" Text="Die Hausnummer muss eingetragen werden" runat="server"
                                     ErrorMessage="Hausnumemr" ValidationGroup="showValOn2" />
                                 </asp:TableCell>
                            </asp:TableRow>
                             <asp:TableRow>
                                 <asp:TableCell>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="errorCheck" ControlToValidate="PLZ" Text="Die Postleitzahl muss eingetragen werden" runat="server"
                                     ErrorMessage="Postleitzahl" ValidationGroup="showValOn2" />
                                 </asp:TableCell>
                            </asp:TableRow>
                             <asp:TableRow>
                                 <asp:TableCell>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="errorCheck" ControlToValidate="City" Text="Die Stadt muss eingetragen werden" runat="server"
                                     ErrorMessage="Stadt" ValidationGroup="showValOn2" />
                                 </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                 <asp:TableCell>
                                     <asp:CustomValidator ID="CustomValidator" CssClass="errorCheck" Text="Ein Lieferdatum muss angegeben werden" runat="server"
                                     ErrorMessage="Calendar" OnServerValidate="checkCalendar" ValidationGroup="showValOn2" />
                                 </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:RegularExpressionValidator ID="regexEmailValid" CssClass="errorCheck" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ControlToValidate="Mail" ValidationGroup="showValOn2" ErrorMessage="Die eingegebene Emailadresse hat ein ung&uuml;ltiges Email Format"></asp:RegularExpressionValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:CompareValidator id="mailCheck" CssClass="errorCheck" runat="server" ErrorMessage="Die eingegebenen Emailadressen stimmen nicht &uuml;berein." Display="Dynamic" 
                            ControlToCompare="Mail" Type="String" ControlToValidate="repeatMail" ValidationGroup="showValOn2" ></asp:CompareValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                       
                        <div id="successMessage">
                            Validierung erfolgreich!<br />
                            Im n&auml;chsten Schritt k&ouml;nnen Sie Ihre Daten &uuml;berpr&uuml;fen.
                        </div>

                        
                        <asp:Button runat="server" ID="goBackToStep2Button" CommandName="PrevView" Text="Zur&uuml;ck" />
                        <asp:Button runat="server" ID="goToStep3Button" CommandName="NextView" OnClick="goToView3" Text="Weiter" />

                        
                    </asp:View>

                    <asp:View ID="View3" runat="server">
                         <asp:Image ID="Image2" ImageUrl="/images/Step3.png" runat="server" />
                        <asp:Table id="checkTable" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>Produkt:</asp:TableCell>
                                <asp:TableCell id="productToBuy"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Lieferdatum:</asp:TableCell>
                                <asp:TableCell id="deliveryDate"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Vorname:</asp:TableCell>
                                <asp:TableCell ID="FirstnameVal"></asp:TableCell> 
                            </asp:TableRow>
                             <asp:TableRow>
                                <asp:TableCell>Nachname:</asp:TableCell> 
                                <asp:TableCell ID="LastnameVal"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                    <asp:TableCell>E-Mail:</asp:TableCell> 
                                    <asp:TableCell ID="MailVal"></asp:TableCell> 
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Lieferadresse:</asp:TableCell> 
                                <asp:TableCell ID="StreetVal"></asp:TableCell>
                                <asp:TableCell ID="HouseNoVal"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell ID="PLZVal"></asp:TableCell>
                                <asp:TableCell ID="CityVal"></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <asp:Button runat="server" ID="goBackToStep2" CommandName="PrevView" Text="Zur&uuml;ck" />
                        <asp:Button runat="server" ID="goToStep4" OnClick="goToStep4_Click" CommandName="NextView" Text="Bestellung Abschlie&szlig;en" />
                       
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                         <asp:Image ID="Image3" ImageUrl="/images/Step4.png" runat="server" />
                        <div id="successMessage2" runat="server">
                            Ihre Bestellung wurde Erfolgreich Versand an 

                        </div>
                        
                        <asp:Button runat="server" ID="Button1" CommandName="PrevView" Text="Zur&uuml;ck" />
                        <input type="button" runat="server" id="newButton" onclick="parent.location='/UE3.aspx'" value="Neue Bestellung" />

                    </asp:View>
                </asp:MultiView>
    
                            
            </div>
        </form>
    </div>
      <script type="text/javascript">
          setInterval(function () {
              var ok = true;
              $(".errorCheck").each(function () {
                  if ($(this).css("display") != "none" && $(this).css("visibility") != "hidden") {
                      ok = false;
                      return false;
                  }
              });
              if (!ok) {
                  jQuery('#errorMessages').show();
                  jQuery('#successMessage').hide();
              }
              else {
                  jQuery('#errorMessages').hide();
                  jQuery('#successMessage').show();
              }
          }, 500);

        </script>
</body>
</html>
