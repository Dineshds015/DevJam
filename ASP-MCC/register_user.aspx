<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register_user.aspx.cs" Inherits="DPDOX_DPDOX_Default2" %>

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
</nav>
</br>   
  <div class="container">
        <div class="row centered-form">
        <div class="center col-lg-8 vh-100" >
        	<div class="panel panel-default" style="opacity:0.9">
        		<div class="panel-heading">
			    		<h3 class="panel-title"><b>Student</b> <small>register</small></h3>
			 	</div>
			 	<div class="panel-body">
                        <asp:Panel ID="Panel1" runat="server">
			    					<div class="form-group">
                                        <asp:TextBox class="form-control input-sm" placeholder="Username" ID="txt_uname" runat="server"></asp:TextBox>
			    					</div>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control input-sm" placeholder="Email" ID="txt_email" runat="server"></asp:TextBox>
			    					</div>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control input-sm" placeholder="Linkedin Link" ID="txt_linkedin" runat="server"></asp:TextBox>
			    					</div>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control input-sm" placeholder="Registration no" ID="txt_reg" runat="server"></asp:TextBox>
			    					</div>
                                    <div class="form-group">
			                           <asp:DropDownList class="btn btn-light dropdown-toggle" ID="ddl_course" runat="server" Height="42px" style="margin-left: 0; margin-top: 25px; width:100%" >
                                         <asp:ListItem Selected="True">Course</asp:ListItem>
                                           <asp:ListItem>B.Tech</asp:ListItem>
                                           <asp:ListItem>MCA</asp:ListItem>
                                           <asp:ListItem>MBA</asp:ListItem>
                                           <asp:ListItem>M.Tech</asp:ListItem>
                                           <asp:ListItem>M.Sc</asp:ListItem>
                                        </asp:DropDownList>
			    					</div>
                                    <div class="form-group">
                                        <asp:Label class="col-sm" ID="lbl_gender" runat="server" Text="Gender:" Font-Bold></asp:Label>
                                        <asp:RadioButton class="col-sm" Text="Male" ID="rb_male" GroupName="gender" runat="server" OnCheckedChanged="rb_male_onClick"/>
                                        <asp:RadioButton class="col-sm" Text="Female" ID="rb_female" GroupName="gender" runat="server" OnCheckedChanged="rb_female_onClick" />
                                        <asp:RadioButton class="col-sm" Text="Other" ID="rb_other" GroupName="gender" runat="server" OnCheckedChanged="rb_other_onClick" />
                                    </div>
                                    <div class="form-group">
			                           <asp:DropDownList class="btn btn-light dropdown-toggle" ID="ddl_city" runat="server" Height="42px" style="margin-left: 0; margin-top: 25px; width:100%" >
                                         
                                       </asp:DropDownList>
			    					</div>
                                    <div class="form-group">
			                            <asp:TextBox class="form-control input-sm" placeholder="Password" ID="txt_pass" runat="server" TextMode="Password"></asp:TextBox>
			    					</div>
                                    <div class="form-group">
			                            <asp:TextBox class="form-control input-sm" placeholder="Confirm Password" ID="txt_cpass" runat="server" TextMode="Password"></asp:TextBox><asp:CompareValidator ID="val_password" runat="server" ErrorMessage="Enter Correct Password" ControlToValidate="txt_cpass" ControlToCompare="txt_pass"></asp:CompareValidator>
			    					</div>
                                    <div class="form-group">
                                        <asp:FileUpload class="form-control input-sm" ID="fu_image" runat="server"/>
			    		            </div>
                                    <asp:Button ID="btn_register" runat="server" Text="Register" class="btn btn-info btn-block" OnClick="btn_signup_Click"/>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
      </div>
<footer class="container-fluid text-center" style="position:absolute; z-index: 100;">
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
<p> &nbsp;</p>
</body>
</html>