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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vision Computer
 */
public class getpwd extends HttpServlet {

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
       PrintWriter out=response.getWriter();
       try
       {
            String uid=request.getParameter("uid");
                String q1=request.getParameter("q1");
                String q2=request.getParameter("q2");
                String q3=request.getParameter("q3");
                Connection con=DB.DBbean.getConn();
                PreparedStatement pst=con.prepareStatement("select userid from reg where userid=? and petname=? and fschoolname=? and fdish=?");
                pst.setString(1,uid);
                pst.setString(2,q1);
                pst.setString(3,q2);
                pst.setString(4,q3);
                ResultSet rs=pst.executeQuery();
                if(rs.next())
                {
                    String id=rs.getString("userid");
                    HttpSession session = request.getSession();
             session.setAttribute("id",id); 
                  out.println("Data verification successfull...");  
                  response.sendRedirect("changepwd.jsp");
                }
                else
                {
                    out.println("no data with given information...");
                }
       }
       catch(Exception e)
       {
           out.println(e);
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
