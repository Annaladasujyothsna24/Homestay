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
public class Plan_Reg_DB extends HttpServlet {

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
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
         try{
          String uid= request.getParameter("uid");
         // String pid= request.getParameter("pid");
          String type=request.getParameter("tins");
          String psdate=request.getParameter("spperiod");
           String pedate=request.getParameter("epperiod");
          String amt=request.getParameter("amt");
           String d=request.getParameter("d").toString();
           
               Connection con=DB.DBbean.getConn();
               PreparedStatement pst1=con.prepareStatement("select * from  plan where pname=?");
               pst1.setString(1, type);
               ResultSet rs=pst1.executeQuery();
               while(rs.next())
                                     {
                   String pid=rs.getString("pid");
             PreparedStatement pst=con.prepareStatement("insert into plan_reg(userid,planid,type,startdate,enddate,amount,regdate)values(?,?,?,?,?,?,?)");
            pst.setString(1, uid);
            pst.setString(2, pid);
            pst.setString(3,type);
            pst.setString(4, psdate);
            pst.setString(5, pedate);
            pst.setString(6,amt);
             pst.setString(7,d);
              pst.executeUpdate();
                    out.println("Your Plan details are submitted successfully");  
                 response.sendRedirect("mhome.jsp?Success..");
                                     } }
            catch(Exception e){
                out.println(e);
               
             out.println(" <script>alert('Invalid Submition of data');window.location.href='claimrequest_DB.jsp'; </script>");
            }
    

   
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
