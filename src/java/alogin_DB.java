/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import DB.DBbean;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;

/**
 *
 * @author Vision Computer
 */
@WebServlet(name = "alogin_DB", urlPatterns = {"/alogin_DB"})
public class alogin_DB extends HttpServlet {

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
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        PrintWriter out=response.getWriter();
        try
        {
          String uid= request.getParameter("regno");          
          String pwd=request.getParameter("pswrd");
          Connection con=DBbean.getConn();
          PreparedStatement pst=con.prepareStatement("select * from admin where userid=? and password=? ");
            pst.setString(1,uid );
            pst.setString(2, pwd);
            ResultSet rs=pst.executeQuery();
              if(rs.next()){   
              response.sendRedirect("ahome.jsp");
              } else{
               
                  out.println(" <script>");
                  out.println(" alert('Invalid Credentials')");
                    out.println("window.location.href='alogin.jsp'");                  
               out.println("</script>");
              }  
        }
        catch(Exception e)
        {
            out.println(e.getMessage());
            e.printStackTrace();
        }
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
