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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SHATTER
 */
public class cact extends HttpServlet {

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
            out.println("<title>Servlet caction</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet caction at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String[] data = new String[3];
        data[0] = request.getParameter("pid");
        data[1] = request.getParameter("did");
        data[2] = request.getParameter("no");
        String action = request.getParameter("action");
        
        user u = new user();
        String mail = null;
        
        try {
            ResultSet rs = u.udata(data[0]);
            rs.next();
            mail = rs.getString("email");
            System.out.println(mail);
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(cact.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(null != action)switch (action) {
            case "in":{
                channeling ch = new channeling();
                try{
                    boolean verify = ch.cin(data);
                    if(verify){
                        out.print("Done!!");
                        String msg = "Successfully Checked In!!!";
                        SendMail.send(mail, "Channeling Status Update", msg);
                        //request.getRequestDispatcher("patients/viewch.jsp").include(request, response);
                        response.sendRedirect("admin/main.jsp");
                    }else{
                        out.print("Error!!");
                        //request.getRequestDispatcher("patients/viewch.jsp").include(request, response);
                        response.sendRedirect("admin/main.jsp");
                    }
                }catch(IOException | ClassNotFoundException | SQLException e){
                    
                }       break;
                }
            case "com":{
                channeling ch = new channeling();
                try{
                    boolean verify = ch.ccom(data);
                    if(verify){
                        out.print("Done!!");
                        String msg = "Successfully Compleated!!!";
                        SendMail.send(mail, "Channeling Status Update", msg);
                        //request.getRequestDispatcher("patients/viewch.jsp").include(request, response);
                        response.sendRedirect("admin/main.jsp");
                    }else{
                        out.print("Error!!");
                        // request.getRequestDispatcher("patients/viewch.jsp").include(request, response);
                        response.sendRedirect("admin/main.jsp");
                    }
                }catch(IOException | ClassNotFoundException | SQLException e){
                      
                }       break;
                }
            case "can":{
                channeling ch = new channeling();
                try{
                    boolean verify = ch.ccom(data);
                    if(verify){
                        out.print("Done!!");
                        String msg = "Successfully Canceled Your Channeling!!!";
                        SendMail.send(mail, "Channeling Status Update", msg);
                        //request.getRequestDispatcher("patients/viewch.jsp").include(request, response);
                        response.sendRedirect("admin/main.jsp");
                    }else{
                        out.print("Error!!");
                        // request.getRequestDispatcher("patients/viewch.jsp").include(request, response);
                        response.sendRedirect("admin/main.jsp");
                    }
                }catch(IOException | ClassNotFoundException | SQLException e){
                      
                }       break;
                }
            default:
                break;
        }
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
