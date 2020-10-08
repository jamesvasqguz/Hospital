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
@WebServlet(name = "RegistrarD", urlPatterns = {"/RegistrarD"})
public class RegistrarD extends HttpServlet {

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
            String colegiado = request.getParameter("colegiado");
            String dpi = request.getParameter("dpi");
            String telefono = request.getParameter("telefono");
            String especialidades = request.getParameter("especialidades");
            String correo = request.getParameter("correo");
            String fecha = request.getParameter("fecha");
            String h1 = request.getParameter("hora1");
            String h2 = request.getParameter("hora2");
            String pass = request.getParameter("pass");
            GestorDB gDB = new GestorDB();
            if (gDB.insertD(codigo, nombre, colegiado, dpi, telefono, correo, h1, h2, fecha)) {
                if (gDB.insertUD(codigo, nombre, pass)) {
                    if (gDB.insertDESP(codigo, especialidades)) {
                        response.sendRedirect("JSP/Admin.jsp");
                    } else {
                        response.sendRedirect("JSP/CrearExamen.jsp");
                    }
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
