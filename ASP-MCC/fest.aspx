<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fest.aspx.cs" Inherits="fest" %>

<!DOCTYPE html>

<html>
<head>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="app_theme.css" rel="stylesheet" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="fests.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;1,100;1,200;1,300;1,400&display=swap" rel="stylesheet">
    <link rel="icon" type="image/xx-icon" href="Content/Design%20Images/tablogo.png"> 
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
        
<div class="main" >
  <div class="content">
        <div class="fests">
            <div class="intro">
                <h2>Hack36</h2>
                <div id="img">
                    <img src="Content/Design%20Images/hack36.png" alt="hack36">
                </div>
            </div>
            <div class="details">
                <h3>Events</h3>
                <ul class="event-links">
                    <li><a href="#">Event-1</a></li>
                    <li><a href="#">Event-2</a></li>
                    <li><a href="#">Event-3</a></li>
                </ul>
                <h3>Description</h3>
                <div class="description">
                    <p>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </p>
                </div>
                <h3>Time</h3>
                <div class="time">
                    23:49-00:00
                </div>
                <hr>
            </div>
        </div>
        <div class="fests">
            <div class="intro">
                <h2>Culrav</h2>
                <div id="img">
                    <img src="Content/Design%20Images/culrav.png" alt="hack36">
                </div>
            </div>
            <div class="details">
                <h3>Events</h3>
                <ul class="event-links">
                    <li><a href="#">Event-1</a></li>
                    <li><a href="#">Event-2</a></li>
                    <li><a href="#">Event-3</a></li>
                </ul>
                <h3>Description</h3>
                <div class="description">
                    <p>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </p>
                </div>
                <h3>Time</h3>
                <div class="time">
                    23:49-00:00
                </div>
                <hr>
            </div>
        </div>
        <div class="fests">
            <div class="intro">
                <h2>Avishkar</h2>
                <div id="img">
                    <img src="Content/Design%20Images/avishkar.png" alt="hack36">
                </div>
            </div>
            <div class="details">
                <h3>Events</h3>
                <ul class="event-links">
                    <li><a href="#">Event-1</a></li>
                    <li><a href="#">Event-2</a></li>
                    <li><a href="#">Event-3</a></li>
                </ul>
                <h3>Description</h3>
                <div class="description">
                    <p>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                    </p>
                </div>
                <h3>Time</h3>
                <div class="time">
                    23:49-00:00
                </div>
            </div>
        </div>
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

