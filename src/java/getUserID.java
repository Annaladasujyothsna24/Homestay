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
public class getUserID extends HttpServlet {

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
                String mail=request.getParameter("mail");
                String q1=request.getParameter("q1");
                String q2=request.getParameter("q2");
                String q3=request.getParameter("q3");
                Connection con=DB.DBbean.getConn();
                PreparedStatement pst=con.prepareStatement("select userid from reg where email=? and petname=? and fschoolname=? and fdish=?");
                pst.setString(1,mail);
                pst.setString(2,q1);
                pst.setString(3,q2);
                pst.setString(4,q3);
                ResultSet rs=pst.executeQuery();
                if(rs.next())
                {
                    String uid=rs.getString("userid");
                  out.println("Data verification successfull...\n User Id is:"+uid);  
                }
                else
                {
                    out.println("no data with given information...");
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
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
