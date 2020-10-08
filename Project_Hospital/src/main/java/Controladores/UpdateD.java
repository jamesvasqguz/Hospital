/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

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

/**
 *
 * @author jara
 */
@WebServlet(name = "UpdateD", urlPatterns = {"/UpdateD"})
public class UpdateD extends HttpServlet {

    Connection cn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

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
        String sql = "UPDATE DOCTOR SET nombre=?,colegiado=?,dpi=?,telefono=?,correo=?,hora_inicio=?,hora_fin=?,fecha_inicio=? WHERE id_doctor=?;";
        String sql1 = "UPDATE USUARIO SET pass=? WHERE id_user=?";
        String sql2 = "UPDATE USUARIO SET nombre=? WHERE id_user=?";
        try {
            cn = conexionDB.conector();
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String cole = request.getParameter("cole");
            String dpi = request.getParameter("dpi");
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");
            String h1 = request.getParameter("horaI");
            String h2 = request.getParameter("horaF");
            String fecha = request.getParameter("fecha");
            String pass = request.getParameter("pass");           
           //System.out.println(" " + id + " " + name + " " + sexo + " " + fecha + " " + dpi + " " + telefono + " " + peso + " " + tipo + " " + correo + " " + pass);
            ps = cn.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, cole);
            ps.setString(3, dpi);
            ps.setString(4, telefono);
            ps.setString(5, correo);
            ps.setString(6, h1);
            ps.setString(7, h2);
            ps.setString(8, fecha);
            ps.setString(9, id);
            ps.executeUpdate();
            if (!(pass.equals(""))) {
                ps = cn.prepareStatement(sql1);
                ps.setString(1, pass);
                ps.setString(2, id);
                ps.executeUpdate();
            }
            ps = cn.prepareStatement(sql2);
            ps.setString(1, nombre);
            ps.setString(2, id);
            ps.executeUpdate();
            response.sendRedirect("JSP/InfoD.jsp");
            conexionDB.cerrar();
        } catch (SQLException e) {
            out.println("Error al actualizar al paciente");
            System.out.println("Error al ingresar al paciente: " + e);
            response.sendRedirect("JSP/Doctor.jsp");
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
