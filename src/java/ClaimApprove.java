/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vision Computer
 */
public class ClaimApprove extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out=response.getWriter();
       try {
           String uid=request.getParameter("uid");
            String cid=request.getParameter("cid");
            String pid=request.getParameter("pid");
            String sd="",ed="";
            Connection con=DB.DBbean.getConn();
             PreparedStatement pst1=con.prepareStatement("select * from plan_reg where userid=? and planid=?");
             pst1.setString(1, uid);
            pst1.setString(2, pid);
            ResultSet rs=pst1.executeQuery();
              while(rs.next()){
                  sd=rs.getString("startdate");
                   ed=rs.getString("enddate");
              }
               PreparedStatement pst2=con.prepareStatement("select * from claimrequest where uid=? and cid=? and cdate between ? and ?");
               pst2.setString(1,"uid");
               pst2.setString(2,"cid");
               pst2.setString(3, "sd");
               pst2.setString(4,"ed");
               ResultSet rs2=pst2.executeQuery();
               if(rs2.next())
               {
            String str = "Approved";       		
             PreparedStatement pst=con.prepareStatement("update claimrequest set status=? where uid=? and cid=?");
            pst.setString(1, str);
            pst.setString(2, uid);
            pst.setString(3, cid);
            pst.executeUpdate();               
            response.sendRedirect("ViewClaimRequests.jsp?Success");  
               }
               else{
                   out.println("Sorry Plan Expired..\nClaim request rejected..");
                   String str = "Reject";       		
             PreparedStatement pst=con.prepareStatement("update claimrequest set status=? where uid=? and cid=?");
            pst.setString(1, str);
            pst.setString(2, uid);
            pst.setString(3, cid);
            pst.executeUpdate();               
            
               }
       	}
       catch(Exception e)
       {
           e.printStackTrace();
           out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
