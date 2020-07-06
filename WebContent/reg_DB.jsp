<%-- 
    Document   : reg_DB
    Created on : 28 May, 2020, 8:20:14 AM
    Author     : Vision Computer
--%>
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
          String fname= request.getParameter("fname");
          String lname= request.getParameter("lname");
          String dob=request.getParameter("dob");
          String gender=request.getParameter("gender");
          String contact=request.getParameter("contact");
             Random r=new Random();
              String uid = String.format("%06d", r.nextInt(1000000));
          //String uid=request.getParameter("uid");
          String pwd=request.getParameter("pwd");
          String utype=request.getParameter("utype");
          
          
               Connection con=DB.DBbean.getConn();
             PreparedStatement pst=con.prepareStatement("insert into reg(fname,lname,dob,gender,contact,userid,password,usertype,status)values(?,?,?,?,?,?,?,?,'waiting')");
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3,dob );
            pst.setString(4, gender);
            pst.setString(5, contact);
            pst.setString(6,uid);
            pst.setString(7,pwd);
            pst.setString(8,utype);
              pst.executeUpdate();
                    out.println("Your details are submitted successfully");%><br><%
              out.println("Your id is:"+uid);
              
              %>
              <br> <a href="ulogin.jsp">Login</a>
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
                  alert("Invalid registeration");
                    window.location.href="register.jsp";                  
              </script>
              <%
               // e.printStackTrace();
                
            }

            %>
      
    </body>
</html>
