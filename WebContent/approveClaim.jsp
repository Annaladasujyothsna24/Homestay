<%-- 
    Document   : approveClaim
    Created on : 30 May, 2020, 2:25:55 PM
    Author     : Vision Computer
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
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
        try {
           
            Date d=new Date();
            SimpleDateFormat formater=new SimpleDateFormat("yyyy-MM-dd");
            String today=formater.format(d);
           String id=request.getParameter("uid");
            String c=request.getParameter("cid");
            String pid=request.getParameter("pid");
            Connection con=DB.DBbean.getConn();
           String sd="",ed="";
            
             PreparedStatement pst1=con.prepareStatement("select * from plan_reg where userid=? and planid=?");
             pst1.setString(1, id);
            pst1.setString(2, pid);
            ResultSet rs=pst1.executeQuery();
              while(rs.next()){
                  sd=rs.getDate("startdate").toString();
                  ed=rs.getDate("enddate").toString();
                                   
              out.println(sd);
                out.println(ed);}             
            String str = "Approved";       		
             PreparedStatement pst=con.prepareStatement("update claimrequest set status=?,processeddate='"+today+"' where uid=? and cid=? and pid=? and cdate >=? and cdate<=?");
            pst.setString(1, str);
            pst.setString(2, id);
            pst.setString(3, c);
             pst.setString(4,pid);
               pst.setString(5, sd);
               pst.setString(6,ed); 
           int i= pst.executeUpdate(); 
         if(i!=0)                   
            response.sendRedirect("ViewClaimRequests.jsp?Success");  
    else{
    String str1 = "Approved";       		
             PreparedStatement pst2=con.prepareStatement("update claimrequest set status=? where uid=? and cid=?");
            pst2.setString(1, str1);
            pst2.setString(2, id);
            pst2.setString(3, c);
            pst2.executeUpdate();               
             response.sendRedirect("ViewClaimRequests.jsp?Rejected");
            
                          }
                          }   
       catch(Exception e)
       {
           e.printStackTrace();
           out.println(e);
        }
        %>
    </body>
</html>
