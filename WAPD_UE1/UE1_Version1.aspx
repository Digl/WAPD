<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UE1_Version1.aspx.cs" Inherits="WAPD_UE1.UE1_Version1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div id="wrapper" style="margin:40px;">
        <h1>Kontakt-Formular v.1</h1>
        <div runat="server" id="info_v1">Kontaktieren Sie uns &uuml;ber unser Kontaktformular:</div>

        <form runat="server" id="contactForm_v1">
            <table style="margin: 20px; background-color: lightgray;">
                <tr>
                    <td>Vorname:</td> 
                    <td><input id="Firstname_v1" type="text" runat="server" /></td>
                </tr>
                <tr>
                    <td>Nachname:</td>
                    <td><input id="Lastname_v1" type="text" runat="server" /></td>
                </tr>
                <tr>
                    <td>Geschlecht:</td>
                    <td><input id="Male_v1" type="radio" runat="server" name="gender" value="male" checked /> m&auml;nnlich
                    <input id="Female_v1" type="radio" runat="server" name="gender" value="female" /> weiblich</td>
                </tr>
                <tr>
                    <td>E-Mail:</td>
                    <td><input id="Mail_v1" type="text" runat="server" /></td>
                </tr>
                <tr>
                    <td><input type="submit" id="Submit_v1" runat="server" value="Submit Form" onserverclick="Submit_ServerClick_v1" /></td>
                </tr>
        
            </table>
        </form>
        <br />
        <br />
    
        <div id="Output_v1" runat="server">
            Nothing submitted yet!
        </div>
    
        <br />
        <br />
        <a href="Default.aspx" >Back to Menu</a>
    </div>
</body>
</html>
