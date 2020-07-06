<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : OfficialWork 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20121012

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Claim Management System</title>
<link href="http://fonts.googleapis.com/css?family=Oswald" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<style type="text/css">
@import "gallery.css";
</style>
<style>
    ul{
        padding: 0;
        list-style: none;
        background: navy;
    }
    ul li{
        display: inline-block;
        position: relative;
        line-height: 21px;
       
    }
    ul li a{
        display: block;
        padding: 8px 25px;
        color: #333;
        text-decoration: none;
         color:white;
        font-weight: 20px;
    }
    ul li a:hover{
        color: #fff;
        background: navy;
    }
    ul li ul.dropdown{
        min-width: 100%; /* Set width of the dropdown */
        background: navy;
        display: none;
        position: absolute;
        z-index: 999;
        left: 0;
    }
    ul li:hover ul.dropdown{
        display: block; /* Display the dropdown */
    }
    ul li ul.dropdown li{
        display: block;
    }
</style>
<script>
    function func()
    {
        var p=document.getElementById("npwd").value;
       
        var cp=document.getElementById("cpwd").value;
      
        if(p!=cp)
            {
            alert('password and cofirm password should be same');
            return false;
            }
            else
                return true;
    }
</script>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h1 style="font-size:70px"><a href="#">Claim Management System</a></h1>
		</div>
	</div>
	<!-- end #header -->
        <center>
       
		 <ul >
        <li><a href="index.html" style="color:white;font-weight: 30px">Home</a></li>
       
        <li>
            <a href="#" style="color:white;font-weight: 30px">Admin</a>
            <ul class="dropdown">
                
                <li><a href="alogin.jsp">Login</a></li>
                
            </ul>
        </li>
        <li>
            <a href="#" style="color:white;font-weight: 30px">User</a>
            <ul class="dropdown">
                <li><a href="register.jsp">Registration</a></li>
                <li><a href="ulogin.jsp">Login</a></li>
                
            </ul>
        </li>
       <!-- <li><a href="#" style="color:white;font-weight: 20px">Contact</a></li>-->
    </ul>
        </center>
	<div>
            <center>
                <div> <center> <h2><font color="navy">Forgot Password</font></h2> <br> 
		 <div class="hoving">
  <form name="fun" action="changepwd" method="post" onsubmit="return func()">
    <input type="password" name="npwd" id="npwd"class="span3" placeholder="Enter New Password" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" required/><br />
    <input type="password" name="cpwd" id="cpwd" class="span3"  placeholder="Enter Confirm Password" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" required/><br>
        
            <br>
     <button class="btn btn-success" type="submit">Change</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button class="btn btn-danger" type="reset">Clear</button>
  </form>
  
    </div>
            </center>
        </div>
</body>
</html>
