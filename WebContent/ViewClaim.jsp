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
<title>Claim Management System</title>
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
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h1><a href="#">Claim Management System</a></h1>
		</div>
	</div>
	<!-- end #header -->
        <div>  <center>
       
		 <ul >
        <li><a href="ahome.jsp" style="color:white;font-weight: 30px">Home</a></li>
       <li>
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
            
        </li>    
                 </ul></div>
        <div> <center> <h2><font color="navy">Claim Details</font></h2> <br> 
                    <div class="hoving">
 
                        <table>
                            <tr>
                                 <th> User Id </th> 
                                <th> Claim Id </th>   
                                <th>Type Of Claim </th>
                                 <th>Policy Id</th>
                                 <th>Claimed Amount</th>
                                 <th>Claimed Date and Time</th>
                                <th>Status</th>
                            </tr>
                            <%
                            String cid=request.getParameter("cid");
           try{
                   Connection con=DB.DBbean.getConn();
          PreparedStatement pst=con.prepareStatement("select * from claimrequest where cid=? ");
           pst.setString(1,cid);
            ResultSet rs=pst.executeQuery();
              while(rs.next()){
                   String uid=rs.getString("uid");
                   String c=rs.getString("cid");
                    String type=rs.getString("claimtype");
                   String pid=rs.getString("pid");
                    String amt=rs.getString("amount");
                   String d=rs.getString("cdate");
                   String status=rs.getString("status");                  
              %>
              <tr>
                  <td><%=uid%></td>
                  <td><%=cid%></td> 
                  <td><%=type%></td>
                  <td><%=pid%></td>
                  <td><%=amt%></td>
                  <td><%=d%></td>
                 <%
                 if(status.equalsIgnoreCase("waiting"))
                                         { %><td><a href="ClaimApprove">Approve</a></td>
                                         <%
                 }
                   else
                   {
                      %> <td><%=status%></td>
                <%   }
                   %>
                 
                  
              </tr>
              <%
                                        }  
                            
    }
    catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("ViewClaimRequests.jsp");
    }
                            %>
                        </table>
      </div>
                </center>
	</div>
                        <br>    <center><h3> <a href="ViewClaimRequests.jsp">Back</a></h3></center>
	<!-- end #page --> 
</div>

<!-- end #footer -->
</body>
</html>
