<%-- 
    Document   : RealiarInforme
    Created on : 29/09/2020, 03:33:39
    Author     : jara
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Backend.Cita"%>
<%@page import="Backend.GestorDB"%>
<%@page import="Backend.Cita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">          
        <title>Consultas</title>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("Loggeado") == null || sesion.getAttribute("Loggeado").equals("0")) {
                response.sendRedirect("UserLogin.jsp");
            }
        %>
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="#"><%=sesion.getAttribute("username")%></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="Doctor.jsp">Principal<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="InfoD.jsp">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="RealiarInforme.jsp">Consultas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">Examenes Realizados con Orden</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ReporteD.jsp">Reportes</a>
                        </li>                   
                    </ul>
                    <form class="form-inline my-2 my-lg-0" action="CerrarSesion.jsp">
                        <button class="btn btn-danger my-2 my-sm-0" type="submit">Salir</button>
                    </form>
                </div>
            </nav>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">  
                    <h1>Mis Consultas</h1>
                    <table class="table table-bordered table-striped">                      
                        <thead>            
                            <tr>
                                <th>Codigo Cita</th>
                                <th>Paciente</th>
                                <th>Doctor</th>
                                <th>Especialidad</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Realizar Informe</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%
                                String id = String.valueOf(sesion.getAttribute("id"));
                                Cita ct = new Cita();
                                GestorDB g = new GestorDB();
                                ArrayList<Cita> list = g.listarCITADOCTOR(id);
                                if (list.size() > 0) {
                                    for (Cita c : list) {
                                        ct = c;
                            %>
                            <tr>
                                <td><%=ct.getId()%></td>
                                <td><%=ct.getPaciente()%></td>
                                <td><%=ct.getMedico()%></td>
                                <td><%=ct.getEspecialidad()%></td>
                                <td><%=ct.getFecha()%></td>
                                <td><%=ct.getHora()%></td>
                                <td>                        
                                    <a href="Informe.jsp?id=<%=ct.getId()%>&pac=<%=ct.getPaciente()%>&esp=<%=ct.getEspecialidad()%>&fecha=<%=ct.getFecha()%>&hora=<%=ct.getHora()%>" target="_blank"><i class="fa fa-file-text-o fa-2x" aria-hidden="true" title="Informe "></i></a>                                    
                                </td>
                            </tr> 
                            <%       }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
