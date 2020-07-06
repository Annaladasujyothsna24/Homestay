<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.Date"%>
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
<title>Hotl Booking Page</title>
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
</head>
<body>
    <%
    String uid=session.getAttribute("uid").toString();
   Date d=new Date();
   SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
  String today=f.format(d);
    Random r=new Random();
    String cid = String.format("%04d", r.nextInt(10000)) ;
    %>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h1><a href="#">Homestay</a></h1>
		</div>
	</div>
	<!-- end #header -->
        <div>  <center>
       
		 <ul >
      <li><a href="mhome.jsp" style="color:white;font-weight: 30px">Home</a></li>
       
        <%--  <li>
            <a href="Plan_Reg.jsp" style="color:white;font-weight: 30px">Plan Registration</a>
           
        </li>
           <li>
            <a href="uploadDoc.jsp" style="color:white;font-weight: 30px">Upload Documents</a>
           
        </li>
        <li>
            <a href="claimrequest.jsp" style="color:white;font-weight: 30px">Request Claim</a>
           
        </li>
        
        <li>
            <a href="claimProgress.jsp?uid=<%=uid%>" style="color:white;font-weight: 30px">Claim Progress</a>
           
        </li>
            <li>
            <a href="searchClaim.jsp?uid=<%=uid%>" style="color:white;font-weight: 30px">Search</a>
           
        </li>
             <li>
            <a href="userTechIssue.jsp?uid=<%=uid%>" style="color:white;font-weight: 30px">Technical Issues</a>
           
        </li>
             <li>
            <a href="userFeedback.jsp?uid=<%=uid%>" style="color:white;font-weight: 30px">Feed Back</a>
           
        </li>
             <li>
            <a href="adminFeedback.jsp?uid=<%=uid%>" style="color:white;font-weight: 30px">View Admin Question</a>
           
        </li>
        <li>
            <a href="index.html" style="color:white;font-weight: 30px">LogOut</a>
            
        </li>       
                  </ul>  --%>
                  </div>
        <div> <center> <h2><font color="navy">Book HomeStay</font></h2> <br> 
		 <div class="hoving">
 
  
    </div>
                </center>
	</div>
        <div>
            <center>
                <form class="login1"name="fun" action="claimrequest_DB" method="post">
   
                    <table>
                        <tr>
                            <td>User Id:</td>
                            <td><input type="text" value="<%=uid%>" name="uid" readonly placeholder="User Id" required /></td>
                            <!--<td><%=uid%></td>-->
                        </tr>
                         <tr>
                            <td>Registration Id:</td>
                            <td><input type="text" name="cid" value="<%=cid%>" readonly/></td>
                        </tr>
                         <tr>
                            <td>Select Homestay:</td>
                            <td><select name="tclaim" required="required" > 
                                    <option value=""></option>
                               <!--<option value="Vehicle Insurance">Vehicle Insurance</option>
                               <option value="Health Insurance">Health Insurance</option>
                               <option value="Natural Disaster Insurance">Natural Disaster Insurance</option>
                               <option value="Homeowner Insurance">Homeowner Insurance</option>//damage due to mold due to appliance failure  due to theft and damage caused by vandalism
                             -->  <%
                             try{
                                   Connection con=DB.DBbean.getConn();
                                   PreparedStatement pst=con.prepareStatement("select * from plan");
                                   ResultSet rs=pst.executeQuery();
                                   while(rs.next())
                                                                             {
                                       String pid=rs.getString("pid");
                                       String pname=rs.getString("pname");
                                       %>
                                       <option value="<%=pname%>"><%=pname%></option>
                                  <% }
                             }
                             catch(Exception e)
                                                                         {
                                 e.printStackTrace();
                                 out.println(e);
                             }
                             %> </select></td>
                        </tr>
                     
                        
                         <tr>
                            <td>No.of rooms:</td>
                            <td><input type="text" name="amt" placeholder="" pattern="[0-9]"/></td>
                        </tr>
                         <tr>
                            <td>Date:</td>
                            <td><input type="text" name="d" value="<%=today%>" /></td>
                        </tr>
                    </table>
                    
                    <br>   
            
     <button class="btn btn-success" type="submit">Book</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button class="btn btn-danger" type="reset">Clear</button>
  </form>
            </center>
        </div>
	<!-- end #page --> 
</div>

<!-- end #footer -->
</body>
</html>
