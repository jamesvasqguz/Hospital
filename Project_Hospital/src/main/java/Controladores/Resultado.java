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
@WebServlet(name = "Resultado", urlPatterns = {"/Resultado"})
public class Resultado extends HttpServlet {

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
        GestorDB g = new GestorDB();
        PrintWriter out = response.getWriter();
        try {
            int agex=Integer.parseInt(request.getParameter("agex"));
            int pac= Integer.parseInt(request.getParameter("pac"));
            String med=request.getParameter("med");
            String exam=request.getParameter("exam");
            String lab=request.getParameter("lab");
            String orden=request.getParameter("info");
            String file=request.getParameter("file");
            String fecha=request.getParameter("fecha");
            String hora=request.getParameter("horaC");
            System.out.println(" "+agex+" "+pac+ " "+med+ " "+exam+ " "+lab+ " "+orden+" "+file+" "+fecha+" "+hora);
            if (g.insertResult(agex, pac, med, exam, lab, orden, file, fecha, hora)) {
                response.sendRedirect("JSP/Laboratorio.jsp");
            } else {
                response.sendRedirect("JSP/Laboratorista.jsp");
            }
        } catch (Exception e) {
        }finally{
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
