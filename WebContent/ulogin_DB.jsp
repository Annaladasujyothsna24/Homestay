<%-- 
    Document   : reg_DB
    Created on : 28 May, 2020, 8:20:14 AM
    Author     : Vision Computer
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <title>User Login</title>
    </head>
    <body>
       <%
        try{
          String uid= request.getParameter("regno");          
          String pwd=request.getParameter("pswrd");
         // String utype=request.getParameter("utype");
          
          
          Connection con=DB.DBbean.getConn();
          PreparedStatement pst=con.prepareStatement("select * from reg where userid=? and password=? and status not in ('Rejected','waiting') ");
            pst.setString(1,uid );
            pst.setString(2, pwd);
            ResultSet rs=pst.executeQuery();
            
              if(rs.next()){                  
               	session.setAttribute("uid",uid);
                Date d=new Date();
				SimpleDateFormat formater=new SimpleDateFormat("yyyy-MM-dd");
           
               	String type = rs.getString("usertype");
               	if(type.equals("Agent")){
            	   response.sendRedirect("chome.jsp");
               	}else
              		response.sendRedirect("mhome.jsp");
               	
              } else{
                	PreparedStatement pst1=con.prepareStatement("select * from reg where userid=?");
            		pst1.setString(1,uid );
            		ResultSet rs1=pst1.executeQuery();
              		if(rs1.next()){ 
                  		String s=rs1.getString("status");
                  		if(s.equalsIgnoreCase("Rejected")){
              %>
                	<script>
                  		alert("Your Profile Rejected..");
                    	window.location.href="ulogin.jsp";                  
              		</script>
             <% 	}else if(s.equalsIgnoreCase("waiting")){  %>
                  
                  	<script>
                  		alert("Your Profile under waiting..");
                    	window.location.href="ulogin.jsp";                  
              		</script>
             <% }  } else{  %>
                  	<script>
                  		alert("Invalid Credentials..");
                    	window.location.href="ulogin.jsp";                  
              		</script>
             <%    }  }           
    }
    catch(Exception e){
        e.printStackTrace();
        //response.sendRedirect("register.jsp");
    }
          
            %>
        
    </body>
</html>
