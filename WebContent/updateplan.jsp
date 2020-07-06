<%@page import="java.util.Random"%>
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
<title>Update</title>
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
   
        try {
           String pid=request.getParameter("pid");
           Connection con=DB.DBbean.getConn();
            PreparedStatement pst=con.prepareStatement("select * from plan where pid=?");
             pst.setString(1, pid);
              ResultSet rs=pst.executeQuery();
              while(rs.next()){
                  String id=rs.getString("pid");
                  String pname=rs.getString("pname");
                  String pdate=rs.getString("pdate");
                  String amt=rs.getString("amt");
                  int TotalRooms = rs.getInt("TotalRooms");
                  int RoomsAvailable = rs.getInt("Roomsavailable");
                  String Contact = rs.getString("contact");
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
        <li><a href="chome.jsp" style="color:white;font-weight: 30px">Home</a></li>
<!--        <li>
            <a href="#" style="color:white;font-weight: 30px">Plan</a>
            <ul class="dropdown">
                
               <li><a href="addPlan.jsp">Add</a></li>
                <li><a href="viewplan.jsp">View</a></li>
            </ul>
        </li>
        <li>
            <a href="ViewLoginRequests.jsp" style="color:white;font-weight: 30px">View Login Requests</a>
           
        </li>
        <li>
            <a href="ViewClaimRequests.jsp" style="color:white;font-weight: 30px">Claim Requests</a>
           
        </li>
        <li>
            <a href="index.html" style="color:white;font-weight: 30px">LogOut</a>
            
        </li>       
                 </ul> --></div>
        <div> <center> <h2><font color="navy">Update Plan</font></h2> <br> 
                    <div class="hoving">
 
                        <div> 
                            <form action="updateplan" name="addp" method="post">
                            <center>
                               
                                <table>
                                    <tr>
                                        <td>Hotel Id:</td>
                                        <td><input type="text" name="pid" value="<%=id%>" readonly/></td>
                                    </tr>
                                     <tr>
                                        <td>Hotel Name:  </td>
                                        <td><input type="text" name="pname" value="<%=pname%>"/> </td>
                                    </tr>
                                    <tr>
                                        <td>Hotel Contact:  </td>
                                        <td><input type="text" name="pcon" value="<%=Contact%>"/> </td>
                                    </tr>
                                     <tr>
                                        <td>Date:  </td>
                                        <td><input type="date" name="pdate" value="<%=pdate%>"/>  </td>
                                    </tr>
                                    <tr>
                                        <td>Total Rooms:  </td>
                                        <td><input type="text" name="prooms" value="<%=TotalRooms%>" pattern="[0-9]+"/> </td>
                                    </tr>
                                    <tr>
                                        <td>Available Rooms:  </td>
                                        <td><input type="text" name="RoomsA" value="<%=RoomsAvailable%>" pattern="[0-9]+"/> </td>
                                    </tr>
                                     <tr>
                                        <td>Amount:  </td>
                                        <td><input type="text" name="amt" value="<%=amt%>" pattern="[0-9]{1,}"/> </td>
                                    </tr>
                                    
                                </table>
                                     <br>   
            
     <button class="btn btn-success" type="submit">Update</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button class="btn btn-danger" type="reset">Clear</button>
                            </center></form>
      </div> 
                </center>
	</div>
       <%   }
                           }
        catch(Exception e)
                               { 
            e.printStackTrace();
            out.println(e);
                       } 
        
    %>
	<!-- end #page --> 
</div>

<!-- end #footer -->
</body>
</html>
