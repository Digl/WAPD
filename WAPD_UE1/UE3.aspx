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
                        <asp:Table runat="server" CellSpacing="10">
                            <asp:TableRow>
                                <asp:TableCell>
                                    Produkt ausw&auml;hlen:
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:DropDownList ID="product" runat="server">
                                    <asp:ListItem>Fernseher</asp:ListItem>
                                    <asp:ListItem>Kaffemaschine</asp:ListItem>
                                    <asp:ListItem>PS4</asp:ListItem>
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
                        <asp:Button runat="server" ID="Button2" CommandName="NextView" OnClick="goToStep2" Text="Weiter" />
                    </asp:View>

                    <asp:View ID="View2" runat="server">

                    <asp:Table runat="server" ID="errorMessages">
                       <asp:TableRow>
                           <asp:TableCell>
                               <asp:CustomValidator runat="server" id="cusCustom" EnableClientScript="true" ClientValidationFunction="firstnameCheck_Client"
                                   CssClass="errorCheck" ControlToValidate="Firstname" OnServerValidate="firstnameCheck" 
                                   Text="Der Vorname muss mindestens zwei Zeichen lang sein!" ErrorMessage="Vorname" />
                           </asp:TableCell>
                       </asp:TableRow>
                       <asp:TableRow>
                           <asp:TableCell>
                               <asp:RegularExpressionValidator ID="regexEmailValid" CssClass="errorCheck" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                   ControlToValidate="Mail" ErrorMessage="Die eingegebene Emailadresse hat ein ung&uuml;ltiges Email Format"></asp:RegularExpressionValidator>
                           </asp:TableCell>
                       </asp:TableRow>
                       <asp:TableRow>
                           <asp:TableCell>
                               <asp:CompareValidator id="mailCheck" CssClass="errorCheck" runat="server" ErrorMessage="Die eingegebenen Emailadressen stimmen nicht &uuml;berein." Display="Dynamic" 
                       ControlToCompare="Mail" Type="String" ControlToValidate="repeatMail"></asp:CompareValidator>
                           </asp:TableCell>
                       </asp:TableRow>
                       <asp:TableRow>
                           <asp:TableCell>
                               <asp:ValidationSummary ID="ValidationSummary1" CssClass="errorCheck" HeaderText="<br />Sie m&uuml;ssen noch folgende Felder ausf&uuml;llen:" DisplayMode="BulletList" 
                       EnableClientScript="true" runat="server" />
                           </asp:TableCell>
                       </asp:TableRow>
                   </asp:Table>
                        <asp:Button runat="server" ID="Button1" CommandName="PrevView" Text="Zur&uuml;ck" />
                        <asp:Button runat="server" ID="Button" CommandName="NextView" Text="Weiter" />

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

                            

        </script>

                    </asp:View>

                    <asp:View ID="View3" runat="server">
                        <asp:Table runat="server">
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
                            <asp:TableRow>
                                <asp:TableCell>
                                    <br />
                                    <asp:Button runat="server" ID="goBackToStep2" CommandName="PrevView" Text="Zur&uuml;ck" />
                                </asp:TableCell>
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell>
                                    <br />
                                    <asp:Button runat="server" ID="goToStep3" CommandName="NextView" Text="Weiter" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:View>
                    <asp:View ID="View4">

                    </asp:View>
                </asp:MultiView>
    
            </div>
        </form>
    </div>
</body>
</html>
