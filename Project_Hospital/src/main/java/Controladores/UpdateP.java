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
@WebServlet(name = "UpdateP", urlPatterns = {"/UpdateP"})
public class UpdateP extends HttpServlet {

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
        String sql = "UPDATE PACIENTE SET nombre=?, sexo=?, fecha_nacimiento=?, dpi=?, telefono=?, peso=?, tipo_sangre=?, correo=? WHERE id_paciente=?;";
        String sql1 = "UPDATE USUARIO SET pass=? WHERE id_user=?";
        String sql2 = "UPDATE USUARIO SET nombre=? WHERE id_user=?";
        try {
            cn = conexionDB.conector();
            int id = Integer.parseInt(request.getParameter("id"));
            String idd = request.getParameter("id");
            String name = request.getParameter("nombre");
            String sexo = request.getParameter("sexo");
            String fecha = request.getParameter("fecha");
            String dpi = request.getParameter("dpi");
            String telefono = request.getParameter("telefono");
            double peso = Double.parseDouble(request.getParameter("peso"));
            String tipo = request.getParameter("tipo");
            String correo = request.getParameter("correo");
            String pass = request.getParameter("pass");
            System.out.println(" " + id + " " + name + " " + sexo + " " + fecha + " " + dpi + " " + telefono + " " + peso + " " + tipo + " " + correo + " " + pass);
            ps = cn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, sexo);
            ps.setString(3, fecha);
            ps.setString(4, dpi);
            ps.setString(5, telefono);
            ps.setDouble(6, peso);
            ps.setString(7, tipo);
            ps.setString(8, correo);
            ps.setInt(9, id);
            ps.executeUpdate();
            if (!(pass.equals(""))) {
                ps = cn.prepareStatement(sql1);
                ps.setString(1, pass);
                ps.setString(2, idd);
                ps.executeUpdate();
            }
            ps = cn.prepareStatement(sql2);
            ps.setString(1, name);
            ps.setString(2,idd);
            ps.executeUpdate();
            response.sendRedirect("JSP/InfoP.jsp");
            conexionDB.cerrar();
        } catch (SQLException e) {
            out.println("Error al actualizar al paciente");
            System.out.println("Error al ingresar al paciente: " + e);
            response.sendRedirect("JSP/Paciente.jsp");
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
