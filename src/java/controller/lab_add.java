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
                String btype = request.getParameter("btype");
                System.out.println(btype);
                
                
                //Patient e=new Patient();
               
                lab lb = new lab();
                user userdata = new user();
                String to = null, name = null, drname = null;
                try{
                    ResultSet rs = userdata.udatanic(data[0]);
                    if(rs.next()){
                        data[0] = rs.getString("id");
                        to = rs.getString("email");
                        name = rs.getString("name");
                        System.out.println(to);
                        
                    }else{
                        if(btype.equals("a")){
                            response.sendRedirect("Lab/admin.jsp?status=nu"); 
                        }
                    }                    
                }catch(ClassNotFoundException | SQLException e){
                    if(btype.equals("a")){
                        response.sendRedirect("Lab/admin.jsp?status=error"); 
                    }else{
                        response.sendRedirect("Lab/labApo.jsp?status=error"); 
                    }
                }
                
                if(lb.checklab(data)){                
                    ResultSet rs = userdata.udata(data[1]);
                    rs.next();
                    drname = rs.getString("name");

                    int status= lb.labadd(data);

                    String msg = "Dear "+name+",<br/>   Your Appoiment For "+data[2]+" is confirmed!!<br/>Date : "+data[3]+"<br/>Time : "+data[4]+"<br/>Reffered by Dr."+drname+".";


                    if(status>0){
                        SendMail.send(to,"Lab Update",msg);
                        if(btype.equals("a")){
                            response.sendRedirect("Lab/admin.jsp?status=success"); 
                        }else{
                            response.sendRedirect("Lab/myapo.jsp?status=success"); 
                        }
                    }else{
                        if(btype.equals("a")){
                            response.sendRedirect("Lab/admin.jsp?status=error"); 
                        }else{
                            response.sendRedirect("Lab/labApo.jsp?status=error"); 
                        }
                    }
                }else{
                    if(btype.equals("a")){
                            response.sendRedirect("Lab/admin.jsp?status=time"); 
                    }else{
                            response.sendRedirect("Lab/labApo.jsp?status=time"); 
                    }
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
