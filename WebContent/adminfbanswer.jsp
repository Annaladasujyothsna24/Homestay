<%-- 
    Document   : adminfbquestion
    Created on : 1 Jun, 2020, 12:33:55 PM
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
          String feed=request.getParameter("feed");
            String ques=request.getParameter("ques");
        String ans=request.getParameter("ans"); 
             Connection con=DB.DBbean.getConn();
             PreparedStatement pst=con.prepareStatement("update feedback set answer=? where uid=? and feedback=? and question=?");
            pst.setString(1, ans);
            pst.setString(2, uid);
             pst.setString(3, feed);
               pst.setString(4, ques);
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
