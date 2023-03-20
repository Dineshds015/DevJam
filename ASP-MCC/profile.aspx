<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<!DOCTYPE html>

<html>
<head>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="app_theme.css" rel="stylesheet" />
    <title>MCC | Profile</title>
    <link rel="icon" type="image/x-icon" href="Content/Design%20Images/tablogo.png"> 
        <style>
        .sidenav {
    height: 100%;
    width: 200px;
    position: fixed;
    z-index: 1;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    padding-top: 20px;
}

.sidenav a, .dropdown-btn {
        padding: 6px 8px 6px 16px;
        text-decoration: none;
        font-size: 20px;
        color: #818181;
        display: block;
        border: none;
        background: none;
        width: 100%;
        text-align: left;
        cursor: pointer;
        outline: none;
    }

.sidenav a:hover, .dropdown-btn:hover {
        color: #f1f1f1;
}

.main {
    margin-left: 200px;
}

.dropdown-container {
    display: none;
    background-color: #262626;
    padding-left: 8px;
}

.fa-caret-down {
    float: right;
    padding-right: 8px;
}

ul.horizontal-list {
    font-size:larger;
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
@media screen and (max-height: 450px) {
    .sidenav {
        padding-top: 15px;
    }
        .sidenav a {
            font-size: 18px;
        }
      .overlay a {font-size: 20px}
  .overlay .closebtn {
  font-size: 40px;
  top: 15px;
  right: 35px;
  }
}
.overlay {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0, 0.9);
  overflow-x: hidden;
  transition: 0.5s;
}

.overlay-content {
  position: relative;
  top: 25%;
  width: 100%;
  text-align: center;
  margin-top: 30px;
}

.overlay a {
  padding: 8px;
  text-decoration: none;
  font-size: 36px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
  color: #f1f1f1;
}

.overlay .closebtn {
  position: absolute;
  top: 20px;
  right: 45px;
  font-size: 60px;
}
.dropbtn {
  color: white;
  padding: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  font-size:smaller;
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

    </style>
</head>
<body>
    <form id="form1" runat="server">
<nav class="navbar navbar-inverse" style="position:sticky; top:0; z-index: 100;">
  <div class="" style="padding-left:0px;">
      <a class="" href="#"><asp:ImageButton ID="ImageButton1" runat="server" src="Content/Design%20Images/logo.png" height="50" Width="130" Onclick="btn_home_Click"/></a>
   </div>
    <ul class="nav horizontal-list navbar-nav">
      <li><asp:LinkButton ID="lb_home" runat="server" OnClick="btn_home_Click">Home</asp:LinkButton></li>
      <li><a href="about.aspx">About</a></li>
      <li class="dropdown">
        <a href="#" class="dropbtn">My Connections</a>
        <div class="dropdown-content">
        <a href="my_connection.aspx">My Connections</a>
        <a href="pending_connection.aspx">Pending_Connections</a>
        <a href="con_request.aspx">Connection requests</a>
        </div>
      </li>
      <li><a style="cursor:pointer" onclick="openNav()">&#128197; Calender</a></li>
      
    </ul>
    <ul class="nav horizontal-list navbar-nav" >
      <li><asp:ImageButton ID="img_c_image" style="box-shadow: 0px 0px 50px rgba(0,0,0,0.5); border-radius:50%" runat="server" ImageUrl='<%#Eval("s_image") %>' Height="50" Width="50" AlternateText="Picture not found" Onclick="btn_img_setting_Click"/></li>
      <li><asp:LinkButton ID="lb_logout" runat="server" OnClick="btn_logout_Click">Logout</asp:LinkButton></li>
    </ul>
</nav>
<div class="sidenav">
  <div class="dropdown">
        <a href="#" class="dropbtn">Treasure</a>
        <div class="dropdown-content">
        <a href="treasure.aspx">Previous Papers</a>
        <a href="about.aspx">Notes</a>
        </div>
  </div>
  <a href="fest.aspx">Fests</a>
  <a href="club.aspx">Clubs</a>
</div>
<div class="main">
    <div class="container ">
        <div class="row centered-form">
        <div class="center col-lg-8 vh-100">
        	<div class="panel panel-default" style=" box-shadow: 0px 0px 10px rgba(0,0,0,0.5);">
        		<div class="panel-heading">
			    		<h3 class="panel-title">User <small>Update</small></h3>
			 			</div>
			 			<div class="panel-body">
                        <asp:Panel ID="Panel1" runat="server">
			    			        <div class="" style="text-align:center;">
                                        <asp:Image ID="img_s_image" style=" box-shadow: 0px 0px 50px rgba(0,0,0,0.5); border-radius:50%" runat="server" ImageUrl='<%#Eval("s_image") %>' Height="150px" Width="140px" AlternateText="Picture not found"/>
			    					</div><br>
			    					<div class="form-group">
                                        <asp:TextBox class="form-control input-sm" placeholder="Name" ID="txt_uname" runat="server"></asp:TextBox>
			    					</div>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control input-sm"  ID="txt_reg" runat="server" ReadOnly></asp:TextBox>
			    					</div>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control input-sm"  ID="txt_email" placeholder="Email" runat="server"></asp:TextBox>
			    					</div>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control input-sm"  ID="txt_linkedin" placeholder="Linkedin Link" runat="server"></asp:TextBox>
			    					</div>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control input-sm"  ID="txt_course" runat="server" ReadOnly></asp:TextBox>
			    					</div>
                                      
                                    <div class="form-group">
			                           <asp:DropDownList class="btn btn-light dropdown-toggle" ID="ddl_city" runat="server" style="width:100%" >
                                         
                                        </asp:DropDownList>
			    					</div>
                                    <asp:Button ID="btn_update" runat="server" Text="Update" class="btn btn-info btn-block" OnClick="btn_update_Click"/>
			    	            </div>
	    		            </div>
    		            </div>
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" class="btn btn-secondary btn-lg btn-block transparent-style" OnClick="btn_delete_Click" OnClientClick="return confirm('Are you sure you want to delete Your Account?');"/>
                    </div> 
                </asp:Panel>
        </div>
</div>

<div id="myNav" class="main overlay">   
    
    <div class="overlay-content">
        <asp:Image ID="img_cal" ImageUrl="Content/Design%20Images/cal.jpg" runat="server" Height="40%" Width="40%" style="opacity:1;" onclick="closeNav()"/>
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
<script>
    function openNav() {
        document.getElementById("myNav").style.width = "100%";
}

    function closeNav() {
        document.getElementById("myNav").style.width = "0%";
}
</script>
</body>
</html>

