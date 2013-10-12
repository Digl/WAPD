<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WAPD_UE1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div id="info_default" runat="server" style="margin-left:60px; margin-top: 30px;">
        Choose a Contact form version:
    </div>
    <form id="chooseLink" runat="server" style="margin:30px; padding: 20px; width: 210px; border-width:3px;
    -webkit-border-image: 
    	-webkit-gradient(linear, 0 0, 0 100%, from(black), to(rgba(0, 0, 0, 0))) 1 100%;
    -webkit-border-image: 
    	-webkit-linear-gradient(black, rgba(0, 0, 0, 0)) 1 100%;
    -o-border-image:
    	     -o-linear-gradient(black, rgba(0, 0, 0, 0)) 1 100%;
    -moz-border-image:
    	   -moz-linear-gradient(black, rgba(0, 0, 0, 0)) 1 100%;">
        <table>
            <tr>
                <td><asp:LinkButton Text="Version 1" PostBackUrl= "~/UE1_Version1.aspx" runat="server">Version 1 (HTML Controls)</asp:LinkButton></td>
            </tr>
            <tr>
                <td><asp:LinkButton ID="LinkButton1" Text="Version 2" PostBackUrl= "~/UE1_Version2.aspx" runat="server">Version 2 (Web Server Controls)</asp:LinkButton></td>
            </tr>
        </table>
    </form>




    
</body>
</html>
