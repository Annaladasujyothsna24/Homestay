/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vision Computer
 */
public class reg_DB extends HttpServlet {

   

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
          String mail=request.getParameter("mail");
          String q1=request.getParameter("q1");
          String q2=request.getParameter("q2");
          String q3=request.getParameter("q3");
          
               Connection con=DB.DBbean.getConn();
             PreparedStatement pst=con.prepareStatement("insert into reg(fname,lname,dob,gender,contact,userid,password,usertype,status,email,petname,fschoolname,fdish)values(?,?,?,?,?,?,?,?,'waiting',?,?,?,?)");
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3,dob );
            pst.setString(4, gender);
            pst.setString(5, contact);
            pst.setString(6,uid);
            pst.setString(7,pwd);
            pst.setString(8,utype);
              pst.setString(9, mail);
            pst.setString(10,q1);
            pst.setString(11,q2);
            pst.setString(12,q3);
              pst.executeUpdate();
                    out.println("Your details are submitted successfully");
                   
              out.println("Your id is:"+uid);
            //out.println(" <br> <a href='ulogin.jsp'>Login</a>");
            }
            catch(Exception e){
                out.println(e);
                
             out.println(" <script>  alert('Invalid registeration');  window.location.href='register.jsp'; </script>");
             
                
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
