/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Backend.GestorDB;
import Backend.conexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jara
 */
@WebServlet(name = "RegistrarP", urlPatterns = {"/RegistrarP"})
public class RegistrarP extends HttpServlet {

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
            String userNombre = request.getParameter("nombre");
            String userSexo = request.getParameter("sexo");
            String userFecha = request.getParameter("fecha");
            String userDPI = request.getParameter("dpi");
            String userTel = request.getParameter("telefono");
            double userPeso = Double.parseDouble(request.getParameter("peso"));
            String userSangre = request.getParameter("tipo");
            String userCorreo = request.getParameter("correo");
            String userPass = request.getParameter("pass");
            GestorDB gDB = new GestorDB();
            if (gDB.insertP(userNombre, userSexo, userFecha, userDPI, userTel, userPeso, userSangre, userCorreo)) {                
                    String id = gDB.selectIP(userNombre, userPass);
                    request.setAttribute("ID", id);
                    request.getRequestDispatcher("JSP/CreacionUP.jsp").forward(request, response);              
            } else {
                request.getRequestDispatcher("JSP/NuevoPaciente.jsp").forward(request, response);
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
