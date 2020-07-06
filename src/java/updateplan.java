/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vision Computer
 */
public class updateplan extends HttpServlet {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
         try{
         
          String pid= request.getParameter("pid");
          String type=request.getParameter("pname");
          String pdate=request.getParameter("pdate").toString();
          String amt=request.getParameter("amt");
          String contact = request.getParameter("pcon").toString();
          int rooms = Integer.valueOf(request.getParameter("prooms"));
          int roomsAvailable = Integer.valueOf(request.getParameter("RoomsA"));
          
           out.println(pid);
               Connection con=DB.DBbean.getConn();
             PreparedStatement pst=con.prepareStatement("update plan set pname=?,pdate=?,amt=?,contact=?,TotalRooms=?,Roomsavailable=? where pid=?");
            pst.setString(1, type);
            pst.setString(2, pdate);
            pst.setString(3,amt);
            pst.setString(4, contact);
            pst.setInt(5, rooms);
            pst.setInt(6, roomsAvailable);
            pst.setString(7, pid);
            
              pst.executeUpdate();
                    out.println("Your Plan details are updated successfully");  
                 //response.sendRedirect("ahome.jsp?Success..");
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
