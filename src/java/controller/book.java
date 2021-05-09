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
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SHATTER
 */
public class book extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        //assign parametes values in to string array
        String[] data = new String[3];
        String to = null, drname = null, drtime = null, newTime=null;
        data[0] = request.getParameter("doctor");
        data[1] = request.getParameter("patient");
        data[2] = request.getParameter("no");
        //calculation for get patiets time. 15 min for each 
        int time = Integer.valueOf(data[2])*15;
        
        
        user userdata = new user();
        channeling ch = new channeling();
        
        //get user email from user id
        try{
            ResultSet rs = userdata.udata(data[1]);
            rs.next();
            to = rs.getString("email");
            System.out.println(to);
        }catch(ClassNotFoundException | SQLException e){
            response.sendRedirect("patients/viewch.jsp?status=error"); 
        }
        
        //get doctor name from doctor id
        try{
            ResultSet rs = userdata.udata(data[0]);
            rs.next();
            drname = rs.getString("name");
        }catch(ClassNotFoundException | SQLException e){
            response.sendRedirect("patients/viewch.jsp?status=error"); 
        }
        
        //calculate time from doctors arrival time
        try{
            ResultSet rs = userdata.drtime(data[0]);
            rs.next();
            drtime = rs.getString("time");
            
            DateTimeFormatter df = DateTimeFormatter.ofPattern("HH:mm");

            LocalTime lt = LocalTime.parse(drtime);
            newTime = df.format(lt.plusMinutes(time));
        }catch(ClassNotFoundException | SQLException e){
            response.sendRedirect("patients/viewch.jsp?status=error"); 
        }
        
        //email string
        String msg = "Your Channeling For Dr. " + drname + " is confirmed. Please make your payment. <br/> <b>Your Number Is :" + data[2] + "</b><br/>Time For Your Number : "+newTime+"<br/><hr/>Horizen Hospitals Channeling Team";
        
        try{
            //make booking from channeling class
            Boolean status = ch.book(data);
            
            if(status){
                try {
                    //send email
                    SendMail.send(to , "Chaneling Confirmation", msg);
                    out.print("Booked Successfull!!");
                } catch (Exception e) {
                    response.sendRedirect("patients/viewch.jsp?status=error"); 
                }
                //if all done direct to channelings view page
                response.sendRedirect("patients/viewch.jsp?status=success");  
            }else{
                response.sendRedirect("patients/viewch.jsp?status=error"); 
            }
        }catch(IOException | ClassNotFoundException | SQLException e){
            response.sendRedirect("patients/viewch.jsp?status=error"); 
            
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
