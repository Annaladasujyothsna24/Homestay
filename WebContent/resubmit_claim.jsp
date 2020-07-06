<%-- 
    Document   : reg_DB
    Created on : 28 May, 2020, 8:20:14 AM
    Author     : Vision Computer
--%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.DBbean"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
       <%
        try{
         String uid=session.getAttribute("uid").toString();
          String cid=session.getAttribute("cid").toString(); 
               Connection con=DB.DBbean.getConn();
             PreparedStatement pst=con.prepareStatement("update claimrequest set status='waiting' where uid=? and cid=?"); 
            pst.setString(1, uid);
            pst.setString(2, cid);
              pst.executeUpdate();
                    out.println("Your Claim details are submitted successfully");%><br><%             
              %>
              <br> <a href="mhome.jsp">Back</a>
              <script>
                  //alert("Your details are submitted successfully");
                  
                  //  window.location.href="slogin.jsp";                  
              </script>
              <%
              
                 //response.sendRedirect("register.jsp?msg=registered");
            }
            catch(Exception e){
                out.println(e);
                 %>
              <script>
                  alert("Invalid Submition of data");
                    window.location.href="claimProgress.jsp";                  
              </script>
              <%
               // e.printStackTrace();
                
            }

            %>
      
    </body>
</html>
