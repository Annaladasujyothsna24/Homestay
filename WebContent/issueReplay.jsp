<%-- 
    Document   : issueReplay
    Created on : 1 Jun, 2020, 11:57:35 AM
    Author     : Vision Computer
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
      try{
          String uid=request.getParameter("uid");
          String issue=request.getParameter("issue");
        String ans=request.getParameter("ans"); 
             Connection con=DB.DBbean.getConn();
             PreparedStatement pst=con.prepareStatement("update techissue set answer=? where uid=? and issue=?");
            pst.setString(1, ans);
            pst.setString(2, uid);
             pst.setString(3, issue);
              int i=pst.executeUpdate();
               if(i!=0)     out.println("Replied Successfully");
              else
                  out.println("not Replied Successfully");
      }
      catch(Exception e)
      {
          e.printStackTrace();
          out.println(e);
      }
      %>
    </body>
</html>
