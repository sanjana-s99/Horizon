/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.SendMail;
import Model.lab;
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
public class lab_add extends HttpServlet {

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
            out.println("<title>Servlet lab_add</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet lab_add at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
            try{
                String[] data = new String[5];
                data[0] =request.getParameter("pid");
                data[1] =request.getParameter("did");
                data[2] =request.getParameter("type");
                data[3] =request.getParameter("date");
                data[4] =request.getParameter("time");
                
                
                //Patient e=new Patient();
               
                lab lb = new lab();
                user userdata = new user();
                String to = null, name = null, drname = null;
                try{
                    ResultSet rs = userdata.udatanic(data[0]);
                    rs.next();
                    data[0] = rs.getString("id");
                    to = rs.getString("email");
                    name = rs.getString("name");
                    System.out.println(to);
                }catch(ClassNotFoundException | SQLException e){
                    out.println("Error");
                }
                
                try{
                    ResultSet rs = userdata.udata(data[1]);
                    rs.next();
                    drname = rs.getString("name");
                }catch(ClassNotFoundException | SQLException e){
                    out.println("Error");
                }
                
                
                int status= lb.labadd(data);
                
                String msg = "Dear "+name+",<br/>   Your Appoiment For "+data[2]+" is confirmed!!<br/>Date : "+data[3]+"<br/>Time : "+data[4]+"<br/>Reffered by Dr."+drname+".";
                
                
                if(status>0){
                    SendMail.send(to,"Lab Update",msg);
                    out.print("<p>Record saved successfully</p>");
                    response.sendRedirect("Lab/myapo.jsp");  
                    //request.getRequestDispatcher("Lab/labApo.jsp").include(request,response);
                }else{
                    out.println("Sorry!unable to save record");
                }
                
                
            }catch(Exception ex){
                System.out.println(ex.getMessage());
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
