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
import javax.servlet.http.HttpSession;

/**
 *
 * @author jara
 */
@WebServlet(name = "InicioS", urlPatterns = {"/InicioS"})
public class InicioS extends HttpServlet {

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
        String userCodigo = request.getParameter("usuario");
        String userPass = request.getParameter("pass");
        //String sql1="SELECT nombre, cast(aes_decrypt(pass,'C1@vE') as char) FROM USUARIOS WHERE id_user=?;";
        String sql = "SELECT nombre, rol FROM USUARIO WHERE id_user=? AND pass=?;";

        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            //Blob b = cn.createBlob();
            //b.setBytes(1, userPass.getBytes());
            ps.setString(1, userCodigo);
            ps.setString(2, userPass);
            rs = ps.executeQuery();
            if (rs.next()) {
                String nombre = rs.getString("nombre");
                String role = rs.getString("rol");
                if (role.equals("ADMINISTRADOR")) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("Loggeado", "1");
                    sesion.setAttribute("username", nombre);
                    sesion.setAttribute("id", userCodigo);
                    response.sendRedirect("JSP/Admin.jsp");
                    //request.getRequestDispatcher("JSP/Admin.jsp").forward(request, response);
                }
                if (role.equals("DOCTOR")) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("Loggeado", "1");
                    sesion.setAttribute("username", nombre);
                    sesion.setAttribute("id", userCodigo);
                    response.sendRedirect("JSP/Doctor.jsp");
                    //request.getRequestDispatcher("JSP/Doctor.jsp").forward(request, response);
                }
                if (role.equals("LABORATORISTA")) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("Loggeado", "1");
                    sesion.setAttribute("username", nombre);
                    sesion.setAttribute("id", userCodigo);
                    String sql1 = "SELECT examen FROM LABORATORISTA WHERE id_labo=?;";
                    try {
                        ps = cn.prepareStatement(sql1);
                        ps.setString(1, userCodigo);
                        rs = ps.executeQuery();
                        if (rs.next()) {
                            sesion.setAttribute("exam", rs.getString("examen"));
                        }
                    } catch (Exception e) {
                    }
                    response.sendRedirect("JSP/Laboratorista.jsp");
                    //request.getRequestDispatcher("JSP/Laboratorista.jsp").forward(request, response);
                }
                if (role.equals("PACIENTE")) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("Loggeado", "1");
                    sesion.setAttribute("username", nombre);
                    sesion.setAttribute("id", userCodigo);
                    response.sendRedirect("JSP/Paciente.jsp");
                    //request.getRequestDispatcher("JSP/Paciente.jsp").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("JSP/ErrorLogin.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el nombre");
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
