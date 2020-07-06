/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Vision Computer
 */
public class addPlan extends HttpServlet {

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
         
          String pid= request.getParameter("pid");
          String uid= request.getParameter("uid");
          String type=request.getParameter("pname");
          String pdate=request.getParameter("pdate").toString();
          String amt=request.getParameter("amt");
          String adr = request.getParameter("paddr").toString();
          String contact = request.getParameter("pcon").toString();
          int rooms = Integer.valueOf(request.getParameter("prooms"));
           
               Connection con=DB.DBbean.getConn();
             PreparedStatement pst=con.prepareStatement("insert into plan(pid,pname,pdate,amt,address,contact,TotalRooms,RoomsAvailable,createdby)values(?,?,?,?,?,?,?,?,?)");
            pst.setString(1, pid);
            pst.setString(2, type);
            pst.setString(3,pdate);
            pst.setString(4, amt);
            pst.setString(5, adr);
            pst.setString(6, contact);
            pst.setInt(7, rooms);
            pst.setInt(8, rooms);
            pst.setString(9, uid);
            
            
              pst.executeUpdate();
                    out.println("Your Plan details are submitted successfully");  
                 response.sendRedirect("viewplan.jsp?uid="+uid);
            }
            catch(Exception e){
                out.println(e);
               
             out.println(" <script>alert('Invalid Submition of data');window.location.href='addPlan.jsp'; </script>");
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
