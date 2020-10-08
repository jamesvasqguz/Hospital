/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Backend.GestorDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jara
 */
@WebServlet(name = "Reporte", urlPatterns = {"/Reporte"})
public class Reporte extends HttpServlet {

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
            int paciente = Integer.parseInt(request.getParameter("paciente"));
            String doc = request.getParameter("doctor");
            String info = request.getParameter("info");
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");

            String examen = request.getParameter("exam");
            String fecha2 = request.getParameter("fecha2");

            String espe = request.getParameter("espe");
            String fecha3 = request.getParameter("fecha3");
            String hora2 = request.getParameter("horaC");
            GestorDB g = new GestorDB();
            System.out.println(" " + paciente + " " + doc + " " + info + " " + fecha + " " + hora + " " + examen + " " + fecha2 + " " + espe + " " + fecha3 + " " + hora2);
            if (g.insertINFORME(paciente, doc, info, fecha, hora)) {
                if (examen.equals("") && fecha2.equals("")) {
                } else {
                    if (g.insertAEXAMD(examen, doc, paciente, fecha2)) {
                    }
                }
                if (fecha3.equals("") && hora2.equals("")) {
                } else {
                    if (g.insertCITA(paciente, doc, espe, fecha3, hora2)) {
                    }
                }
                response.sendRedirect("JSP/Doctor.jsp");
            }
        } catch (Exception e) {
            System.out.println("Error al terminar proceso: " + e);
            response.sendRedirect("JSP/Informe.jsp");
        } finally {
            out.close();
            System.out.println("Error al terminar proceso");
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
