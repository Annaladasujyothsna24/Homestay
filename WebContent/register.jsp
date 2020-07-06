<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

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
<title>Homestay Register</title>
<link href="http://fonts.googleapis.com/css?family=Oswald" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<style type="text/css">
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
<script type="text/javascript">
function funn()
{
 var pswrd=document.getElementById('pswrd').value;
 var cpswrd=document.getElementById('cpswrd').value;
 if(pswrd!=cpswrd){
     alert("Password And Confirm Password Should Match");
     return false;
 }
}
</script>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css" />
<script src="js/jquery.min.js"c></script> 
<script src="js/bootstrap.js" ></script>
<script type="text/javascript">
 $(document).ready(function()
 {
	 $('#mycarousel').carousel({
	 interval:3000
	 });
 });
</script>
<script type="text/javascript">
function validfname()
{   
    var n=document.getElementById("fname").value;
    if(n==null||n==""){
       
        document.getElementById('nameerr').innerHTML='First name cannot be empty';
        
        return false;}
     else
         document.getElementById('nameerr').innerHTML='';
}
function validlname()
{
    var n=document.getElementById("lname").value;
    if(n==null||n==""){
        document.getElementById('lnameerr').innerHTML='last name cannot be empty';
        return false;}
    else
         document.getElementById('lnameerr').innerHTML='';
}
function validgender()
{
    if(document.getElementById('gender_Male').checked) {
          document.getElementById('gendererr').innerHTML='';
    }
    else if(document.getElementById('gender_Female').checked) { 
          document.getElementById('gendererr').innerHTML='';
    }
    else
         document.getElementById('gendererr').innerHTML='Must select gender';
}
function validage()
{   
 var dob=document.getElementById('dob').value;
  if(dob==null||dob==""){
        document.getElementById('ageerr').innerHTML='Date of Birth cannot be empty';
        return false;
    }
    else
        {
              document.getElementById('ageerr').innerHTML='';
 var birthdate = new Date(dob);
 var today = new Date();
 var diff = today-birthdate; // This is the difference in milliseconds
var age = Math.floor(diff/31557600000);
 if(age<18){
     alert("Age not sifficient");
    return false;
 }
}
}
function validcontact()
{
    var n=document.getElementById("contact").value;
    if(n==null||n==""){
        document.getElementById('contacterr').innerHTML='Contact number cannot be empty';
        return false;}
    else
         document.getElementById('contacterr').innerHTML='';
}
function validpwd()
{
    var n=document.getElementById("pwd").value;
    if(n==null||n==""){
        document.getElementById('pwderr').innerHTML='Password cannot be empty';
        return false;}
    else
         document.getElementById('pwderr').innerHTML='';
}
function validmail()
{
    var n=document.getElementById("mail").value;
    if(n==null||n==""){
        document.getElementById('mailerr').innerHTML='mail cannot be empty';
        return false;}
    else
         document.getElementById('mailerr').innerHTML='';
}

</script>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h1><a href="#">Homestay</a></h1>
		</div>
	</div>
	<!-- end #header -->
        <div>  <center>
       
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
      
                 </ul></div>
        <div>
            <center>
            <div class="hoving">
                     <h2><font color="navy">Hi! Register Here</font></h2> <br>       
                         <form class="login1"name="fun" action="reg_DB" method="post" onsubmit="return validage()">
      <table>
          <tr>
              <td>Member Id:</td>
              <td><input type="text" name="uid" readonly placeholder="Generated automatically" /></td>
             
          </tr>
          <tr>
              <td>First Name:</td>
              <td><input type="text" autofocus name="fname" id="fname" placeholder="First Name" onblur="validfname()" pattern="[A-Za-z]{4,}" title="only alphbets" required/></td>
              <td><p id="nameerr" style="color:red"></p></td>
          </tr>
           <tr>
              <td>Last Name:</td>
              <td><input type="text" name="lname" id="lname" placeholder="Last Name" onblur="validlname()" pattern="[A-Za-z]{1,}" title="only alphbets"required/></td>
              <td><p id="lnameerr" style="color:red"></p></td>
           </tr>
           <tr>
              <td>DOB:</td>
              <td><input type="Date" name="dob" id="dob" placeholder="DOB" title="Date Format" onblur="validage()" required/></td>
                <td><p id="ageerr" style="color:red"></p></td>
          </tr>
          <tr>
              <td>Gender:</td>
              <td><input type="radio" name="gender" value="Male" id="gender_Male" onblur="validgender()" required/> Male
              <input type="radio" name="gender" value="Female" id="gender_Female" onblur="validgender()" required/> Female</td>
               <td><p id="gendererr" style="color:red"></p></td>
          </tr>
           <tr>
              <td>Contact:</td>
              <td><input type="text" name="contact" id="contact" placeholder="Contact Number" onblur="validcontact()" pattern="[6-9]{1}[0-9]{9}" title="only numbers"required/></td>
              <td><p id="contacterr" style="color:red"></p></td>
           </tr>
          <tr>
              <td>Email Id:</td>
              <td><input type="email" name="mail" id="mail" placeholder="Email address" onblur="validmail()" required/></td>
              <td><p id="mailerr" style="color:red"></p></td>
           </tr>
           
           <tr>
              <td>Password:</td>
              <td><input type="password" name="pwd" id="pwd" placeholder="Password" onblur="validpwd();" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" required/></td>
                 <td><p id="pwderr" style="color:red"></p></td>
           </tr>
          
         <!--  <tr>
              <td>What is your Pet Name:</td>
              <td><input type="text" name="q1" required placeholder="Pet Name" /></td>
             
          </tr>
          <tr>
              <td>What is your First School Name:</td>
              <td><input type="text" name="q2" required placeholder="First School Name" /></td>
             
          </tr>
           <tr>
              <td>What is your favourite Dish:</td>
              <td><input type="text" name="q3" required placeholder="favourite Dish" /></td>
             
          </tr> -->
           <tr>
              <td>User Type:</td>
              <td><input type="radio" value="Member" name="utype" required/> Customer
              <input type="radio" value="Agent" name="utype" required/> Owner</td>
          </tr>
      </table> 
      <br></br>
    
    
    
    
    
   
     <button class="btn btn-success" type="submit">Submit</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button class="btn btn-danger" type="reset">Clear</button>
  </form>
    </div>
        </center></div>
        
</body>
</html>
