/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Backend.GestorDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jara
 */
@WebServlet(name = "RegistrarL", urlPatterns = {"/RegistrarL"})
public class RegistrarL extends HttpServlet {

    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

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
        PrintWriter out = response.getWriter();
        try {
            String codigo = request.getParameter("codigo");
            String nombre = request.getParameter("nombre");
            String registro = request.getParameter("registro");
            String dpi = request.getParameter("dpi");
            String telefono = request.getParameter("telefono");
            String examen = request.getParameter("examen");
            String correo = request.getParameter("correo");
            String fecha = request.getParameter("fecha");
            String pass = request.getParameter("pass");
            
            String dom = request.getParameter("diad");
            String lu = request.getParameter("dial");
            String ma = request.getParameter("diama");
            String mi = request.getParameter("diami");
            String ju = request.getParameter("diaj");
            String vi = request.getParameter("diav");
            String sa = request.getParameter("dias");

            GestorDB gDB = new GestorDB();
            if (gDB.insertL(codigo, nombre, registro, dpi, telefono, examen, correo, fecha)){
                if (gDB.insertUL(codigo, nombre, pass)) {
                    if (dom != null) {
                        gDB.insertDL(codigo, dom);
                    }
                    if (lu != null) {
                        gDB.insertDL(codigo, lu);
                    }
                    if (ma != null) {
                        gDB.insertDL(codigo, ma);
                    }
                    if (mi != null) {
                        gDB.insertDL(codigo, mi);
                    }
                    if (ju != null) {
                        gDB.insertDL(codigo, ju);
                    }
                    if (vi != null) {
                        gDB.insertDL(codigo, vi);
                    }
                    if (sa != null) {
                        gDB.insertDL(codigo, sa);
                    }
                    response.sendRedirect("JSP/Admin.jsp");
                } else {
                    response.sendRedirect("JSP/CreacionUL.jsp");
                }
            } else {
                response.sendRedirect("JSP/CreacionUD.jsp");
            }
        } finally {
            out.close();
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
