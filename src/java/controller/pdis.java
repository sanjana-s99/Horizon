/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.SendMail;
import Model.admit;
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
public class pdis extends HttpServlet {

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
            out.println("<title>Servlet pdis</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet pdis at " + request.getContextPath() + "</h1>");
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

        String index = request.getParameter("index");
        String nic = request.getParameter("nic");
        String ward = request.getParameter("ward");
        String bed = request.getParameter("bed");
        String pat = request.getParameter("patient");
        String rprice = request.getParameter("room");
        String dfee = request.getParameter("doc");
        String pbill = request.getParameter("pham");
        String other = request.getParameter("other");
        String tot = request.getParameter("tot");
        
        admit dis = new admit();
        user udata = new user();
        
        
        if(ward.equals("null")){
            try{
                ResultSet rs = udata.udatanic(nic);
                rs.next();
                String email = rs.getString("email");
                String mail = "Dear "+pat+",<br/>Horizen Hospital Discharge Bill<br/><hr/>Room No : "+bed+"<br/>Room Charges : "+rprice;
                mail = mail +"<br/>Doctor Fee : "+dfee+"<br/>Pharmacy Bill : "+pbill+"<br/>Other Fees : "+other+"<br/>Total Fee : "+tot+"<br/>Thank Your For Your Payment.<br/>Horizn Hospital";
                SendMail.send(email, "Horizen Hospital Discharge Bill", mail);
                if(dis.rdis(index)){
                    response.sendRedirect("staff/admitdata.jsp?status=dis"); 
                }
            }catch(Exception e){
                response.sendRedirect("staff/admitdata.jsp?status=error");
            }
        }else{
            try{
                ResultSet rs = udata.udatanic(nic);
                rs.next();
                String email = rs.getString("email");
                String mail = "Dear "+pat+",<br/>Horizen Hospital Discharge Bill<br/><hr/>Ward : "+ward+"<br/>BedNo : "+bed+"<br/>Room Charges : "+rprice;
                mail = mail +"<br/>Doctor Fee : "+dfee+"<br/>Pharmacy Bill : "+pbill+"<br/>Other Fees : "+other+"<br/>Total Fee : "+tot+"<br/>Thank Your For Your Payment.<br/>Horizn Hospital";
                SendMail.send(email, "Horizen Hospital Discharge Bill", mail);
                if(dis.wdis(index)){
                    response.sendRedirect("staff/admitdata.jsp?status=dis");
                }
            }catch(Exception e){
                response.sendRedirect("staff/admitdata.jsp?status=error");
            }
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
