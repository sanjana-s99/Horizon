/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.SendMail;
import Model.channeling;
import Model.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SHATTER
 */
public class sbook extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet book</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet book at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");

        String[] data = new String[3];
        String to = null, drname = null;
        data[0] = request.getParameter("doctor");
        data[1] = request.getParameter("patient");
        data[2] = request.getParameter("no");
        
        user userdata = new user();
        try{
            ResultSet rs = userdata.udatanic(data[1]);
            //check user exist status. if not direct again for booking
            if(!rs.next()){
                response.sendRedirect("staff/staffchannel.jsp?status=nouser&doc="+data[0]);
            }
            to = rs.getString("email");
            System.out.println(to);
        }catch(ClassNotFoundException | SQLException e){
        }
        
        try{
            ResultSet rs = userdata.udata(data[0]);
            rs.next();
            drname = rs.getString("name");
        }catch(ClassNotFoundException | SQLException e){
        }
        
        String msg = "Your Channeling For Dr. " + drname + " is confirmed. Please make your payment. <br/> <b>Your Number Is :" + data[2] + "</b><br/><hr/>Horizen Hospitals Channeling Team";
        
        
        
        try{
            user getdata = new user();
            ResultSet rs = getdata.udatanic(data[1]);
            rs.next();            
            data[1] = rs.getString("id");
        
            channeling ch = new channeling();
            Boolean status = ch.book(data);
            
            if(status){
                try {
                    SendMail.send(to , "Chaneling Confirmation", msg);
                } catch (Exception e) {
                }
                 
                //is all done staff direct to doctors channeling page
                 response.sendRedirect("staff/staffchannel.jsp?status=book&doc="+data[0]);
            }else{
                response.sendRedirect("staff/staffchannel.jsp?status=error&doc="+data[0]);
            }
        }catch(IOException | ClassNotFoundException | SQLException e){
            
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
