<%-- 
    Document   : reg_DB
    Created on : 28 May, 2020, 8:20:14 AM
    Author     : Vision Computer
--%>
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
        <title>Admin Login</title>
    </head>
    <body>
       <%
        try{
          String uid= request.getParameter("regno");          
          String pwd=request.getParameter("pswrd");
          
          
          Connection con=DB.DBbean.getConn();
          PreparedStatement pst=con.prepareStatement("select * from admin where userid=? and password=? ");
            pst.setString(1,uid );
            pst.setString(2, pwd);
            ResultSet rs=pst.executeQuery();
              if(rs.next()){   
              response.sendRedirect("ahome.jsp");
              } else{
                %>
                  <script>
                  alert("Invalid Credentials");
                    window.location.href="alogin.jsp";                  
              </script>
             <% }            
    }
    catch(Exception e){
        e.printStackTrace();
       // response.sendRedirect("register.jsp?msg=failed");
    }
          
            %>
        
    </body>
</html>
