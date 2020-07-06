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
<title>Update Homestay</title>
<link href="http://fonts.googleapis.com/css?family=Oswald" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<style type="text/css">
</style>
<style>
     table th,tr,td{border-collapse: collapse;
    border:2px solid navy;
    padding:10px;}
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
     String uid=request.getParameter("uid");
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
       <!-- <li>
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
            <a href="report.jsp" style="color:white;font-weight: 30px">Reports</a>
           
        </li>
          <li>
            <a href="viewIssue.jsp" style="color:white;font-weight: 30px">View Technical Issues</a>
           
        </li>
         <li>
            <a href="viewFeedBack.jsp" style="color:white;font-weight: 30px">View FeedBack</a>
           
        </li>
        <li>
            <a href="index.html" style="color:white;font-weight: 30px">LogOut</a>
            
        </li> </ul> --> 
        </div>
        <div> <center> <h2><font color="navy">Update Homestay Details</font></h2> <br> 
		 <div class="hoving">
                     <div>
                         <table>
                             <tr><th>Hotel Id</th>
                             <th> Room Type</th>
                             <th>Created Date</th>
                             <th>Amount per Room</th>
                             <th>Total Rooms</th>
                             <th>Rooms available</th>
                             <th>Update</th></tr>
                              <%
                            try{
                   Connection con=DB.DBbean.getConn();
          PreparedStatement pst=con.prepareStatement("select * from plan where createdby=?");
          pst.setString(1, uid);
            ResultSet rs=pst.executeQuery();
              while(rs.next()){
                   String pid=rs.getString("pid");
                   String pname=rs.getString("pname");
                   String pdate=rs.getString("pdate");
                   String amt=rs.getString("amt");
                   int TotalRooms = rs.getInt("TotalRooms");
                   int RoomsAvailable = rs.getInt("Roomsavailable");
              %>
              <tr>
                  <td><%=pid%><input type="hidden" name="id" value="<%=pid%>"/></td>
                  <td><%=pname%></td>
                  <td><%=pdate%></td>                 
                  <td><%=amt%></td> 
                  <td><%=TotalRooms%></td> 
                  <td><%=RoomsAvailable%></td> 
                  <td><a href="updateplan.jsp?pid=<%=pid%>" >Update</a></td> 
              </tr>
               <%
                                        }  
                            
    }
    catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("viewplan.jsp");
    }
                            %>
                         </table>
                     </div>
  
    </div>
                </center>
	</div>
	
	<!-- end #page --> 
</div>

<!-- end #footer -->
</body>
</html>
