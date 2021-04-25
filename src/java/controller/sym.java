/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.dfind;
import Model.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SHATTER
 */
public class sym extends HttpServlet {

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
            out.println("<title>Servlet sym</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sym at " + request.getContextPath() + "</h1>");
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
        
        String symp_1=request.getParameter("symptom1");
        String symp_2=request.getParameter("symptom2");
        String symp_3=request.getParameter("symptom3");
        
        
        dfind con = new dfind();
        try {
            ResultSet rs = con.symptomCheck(symp_1, symp_2,symp_3);
            while(rs.next()){
                String disease = rs.getString("disease");
                out.println("Possible : "+disease);
                out.println("<br/>");
                String sid = rs.getString("specialist_id");
                ResultSet r=con.getDoctor(sid);
                while(r.next()){
                    String id =r.getString("id");
                    user data = new user();
                    ResultSet rr = data.udata(id);
                    if(rr.next()){
                        out.println(rr.getString("name"));
                        out.println("   <a href='patients/channel.jsp?doc="+rr.getString("id")+"'>Channel Doctor</a>");
                    }
                        
                    out.println("<br/>");
                    out.println("<br/>");
                    
                }
                
                
                
                
            }
        } catch (Exception ex) {
            System.out.println(ex);
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
