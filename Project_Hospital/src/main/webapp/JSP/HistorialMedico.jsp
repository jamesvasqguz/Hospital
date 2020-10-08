<%-- 
    Document   : HistorialMedico
    Created on : 27/09/2020, 06:10:17
    Author     : jara
--%>

<%@page import="Backend.Resultado"%>
<%@page import="Backend.Informe"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Backend.GestorDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Backend.conexionDB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">          
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">        
        <title>Historial Medico</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("Loggeado") == null || sesion.getAttribute("Loggeado").equals("0")) {
                response.sendRedirect("UserLogin.jsp");
            }
        %>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="#"><%=sesion.getAttribute("username")%></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="Paciente.jsp">Principal<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href=InfoP.jsp>Mi informacion</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="HistorialMedico.jsp">Historial medico</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="HistorialCitas.jsp">Citas con Medicos y Laboratorio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AgendarCita.jsp">Agendar cita</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AgendarExamen.jsp">Agendar Examen</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Bandeja de correo</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ReporteP.jsp">Mis Reportes</a>
                        </li>                         
                    </ul>
                    <form class="form-inline my-2 my-lg-0" action="CerrarSesion.jsp">
                        <button class="btn btn-danger my-2 my-sm-0" type="submit">Salir</button>
                    </form>
                </div>
            </nav>
        </div>
        <div class="container mt-5">
            <h1>Consultas realizadas y Examenes realizados en el laboratorio</h1>
            <div class="row">
                <div class="col-sm">    
                    <h5>Reporte de Citas Medicas</h5>
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">            
                            <tr>
                                <th>Codigo Reporte</th>
                                <th>Paciente</th>
                                <th>Doctor</th>
                                <th>Informacion</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%
                                String id = String.valueOf(sesion.getAttribute("id"));
                                Informe i = new Informe();
                                GestorDB g = new GestorDB();
                                ArrayList<Informe> list = g.listarRESULT(id);
                                if (list.size() > 0) {
                                    for (Informe ifn : list) {
                                        i = ifn;
                            %>
                            <tr>
                                <td><%=i.getIdInfo()%></td>
                                <td><%=i.getPacInfo()%></td>
                                <td><%=i.getDocInfo()%></td>
                                <td><%=i.getInforme()%></td>
                                <td><%=i.getFechaInfo()%></td>
                                <td><%=i.getHoraInfo()%></td>
                            </tr> 
                            <%       }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">    
                    <h5>Resultados de Examenes del Laboratorio</h5>
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">            
                            <tr>
                                <th>Codigo Resultado</th>
                                <th>Examen Agendado</th>
                                <th>Paciente</th>
                                <th>Doctor</th>
                                <th>Examen</th>
                                <th>Laboratorista</th>
                                <th>Orden</th>
                                <th>Archivo</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%
                                Resultado r = new Resultado();
                                ArrayList<Resultado> listar = g.listarEXAMREALIZADO(id);
                                if (listar.size() > 0) {
                                    for (Resultado re : listar) {
                                        r = re;
                            %>
                            <tr>
                                <td><%=r.getIdRslt()%></td>
                                <td><%=r.getIdAgex() %></td>
                                <td><%=r.getPacRslt()%></td>
                                <td><%=r.getDocRslt()%></td>
                                <td><%=r.getExamRslt()%></td>
                                <td><%=r.getLabRslt()%></td>
                                <td><%=r.getOrdenRslt()%></td>
                                <td>
                                    <%
                                        if (r.getArchivo() != null) {
                                    %>
                                    <a href="../MostrarARCH?id=<%=r.getIdRslt()%>&tipo=<%=r.getOrdenRslt()%>" target="_blank"><i class="fa fa-file-text-o fa-2x" aria-hidden="true" title="ARCHIVO"></i></a>
                                        <%
                                            } else {
                                                out.print("SIN ARCHIVO");
                                            }
                                        %>
                                </td>
                                <td><%=r.getFechaRslt()%></td>
                                <td><%=r.getHoraRslt()%></td>
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
