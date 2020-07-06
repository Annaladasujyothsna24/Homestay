<%-- 
    Document   : reg_DB
    Created on : 28 May, 2020, 8:20:14 AM
    Author     : Vision Computer
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.DBbean"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Claim Management System</title>
    </head>
    <body>
       <%
       try {
           String id=request.getParameter("id");
	   String str = "Rejected";
       		 Connection con=DB.DBbean.getConn();
             PreparedStatement pst=con.prepareStatement("update reg set status=? where userid=?");
            pst.setString(1, str);
            pst.setString(2, id);
            pst.executeUpdate();               
                response.sendRedirect("ViewLoginRequests.jsp");
               
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		
	%>
       %>
    </body>
</html>
