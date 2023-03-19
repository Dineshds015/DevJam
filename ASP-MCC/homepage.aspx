<%@ Page Language="C#" AutoEventWireup="true" CodeFile="homepage.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="app_theme.css" rel="stylesheet" />
    <title>Homepage</title>
    <link rel="icon" type="image/x-icon" href="Content/Design%20Images/tablogo.png">
    <style>
        ul.horizontal-list {
    list-style: none;
    color: white;
    display: inline-block;
    padding: 1rem 2rem;
}

    ul.horizontal-list li {
        display: inline-block;
        padding: 0 0.5rem;
        min-width: 7rem;
        text-align: center;
        cursor: pointer;
    }
    </style>
</head>
<body style="">
<form id="form1" runat="server">
<nav class="navbar navbar-inverse" style="position:sticky; top:0; z-index: 100;">
  <div class="" style="padding-left:0px;">
      <a class="" href="#"><asp:ImageButton ID="ImageButton1" runat="server" src="Content/Design%20Images/logo.png" height="50" Width="130" Onclick="btn_home_Click"/></a>
   </div>
    <ul class="nav horizontal-list navbar-nav">
      <li><a href="homepage.aspx">Home</a></li>
    </ul>
  </div>
</nav>
</br>   

<div class="container text-center ">
    <asp:Label ID="lbl" runat="server" Text="Join hands and thrive in a vibrant community of learners, leaders, and achievers!" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color:darkgray" Font-Size="X-Large" Font-Bold="false"></asp:Label>
    </br></br>
        <div class="row centered-form">
            <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Student <small>login</small></h3>
                    </div>
			 		<div class="panel-body mx-auto" style="">
	       			<div class="form-group">
                        <asp:TextBox class="form-control input-sm" placeholder="Registration" ID="txt_reg" runat="server"></asp:TextBox>
		   			</div>
			        <div class="form-group">
			            <asp:TextBox class="form-control input-sm" placeholder="Password" ID="txt_pass" runat="server" TextMode="Password"></asp:TextBox>
			    	</div>
			        <div class="form-group">
                        <asp:CheckBox ID="rememberme" runat="server"/>&nbsp Remember me
                    </div>
       		   	    <asp:Button ID="Button1" runat="server" class="btn btn-info btn-block" Text="Login" Onclick="btn_login_Click"/>
                    <asp:LinkButton ID="lb_hta" runat="server" OnClick="link_signup_Click">Don't have account?</asp:LinkButton>
                </div>
	        </div>
    	</div>
    </div></div>
<footer class="container-fluid text-center" style="position:absolute; bottom:0;">
  <asp:ImageButton ID="btn_img_facebook" runat="server" src="Content/Design%20Images/facebook.png" Height="40" Width="40" onClick="btn_fb_onClick"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  <asp:ImageButton ID="btn_img_twitter" runat="server" src="Content/Design%20Images/twitter.png" Height="40" Width="40" onClick="btn_tt_onClick"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  <asp:ImageButton ID="btn_img_insta" runat="server" src="Content/Design%20Images/insta.png" Height="40" Width="40" onClick="btn_ig_onClick"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  <asp:ImageButton ID="btn_img_email" runat="server" src="Content/Design%20Images/email.png" Height="40" Width="40" onClick="btn_em_onClick"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  <asp:ImageButton ID="btn_img_feed" runat="server" src="Content/Design%20Images/feed.png" Height="40" Width="40" onClick="btn_fd_onClick"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br /><br />
<p>A college community web development project can be a great way to bring together the various members of the college community and create a centralized hub for information and communication.
    The website can include features such as student and faculty directories, event calendars, news and announcements, discussion forums, and online resources such as study guides and tutorials.
    The web development project can be designed to be user-friendly and accessible to all members of the college community<br />
MCC is powered by <b>The Mutuals@mnnit</b></p>  
</footer>
</form>
</body>
</html>
