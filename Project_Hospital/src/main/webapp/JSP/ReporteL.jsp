<%-- 
    Document   : ReporteL
    Created on : 8/10/2020, 05:56:21
    Author     : jara
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Backend.Resultado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Backend.AgendarExamen"%>
<%@page import="Backend.AgendarExamen"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Backend.conexionDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="Backend.GestorDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">                 
        <title>Mis Reportes</title>
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
        <%
            String id = String.valueOf(sesion.getAttribute("id"));
            String ex = String.valueOf(sesion.getAttribute("exam"));
            GestorDB g = new GestorDB();
            Connection cn = null;
            cn = conexionDB.conector();
            PreparedStatement ps = null;
            ResultSet rs = null;
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
                            <a class="nav-link" href="Laboratorista.jsp">Principal<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="InfoL.jsp">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Laboratorio.jsp">Laboratorio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ReporteL.jsp">Mis Reportes</a>
                        </li>                   
                    </ul>
                    <form class="form-inline my-2 my-lg-0" action="CerrarSesion.jsp">
                        <button class="btn btn-danger my-2 my-sm-0" type="submit">Salir</button>
                    </form>
                </div>
            </nav>
        </div>
        <div class="container mt-5">
            <h3>Reporte de exámenes a realizarse en su turno del día.</h3>
            <div class="row">
                <div class="col-sm"> 
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">            
                            <tr>
                                <th>Examen Agendado</th>
                                <th>Examen</th>
                                <th>Doctor</th>
                                <th>Paciente</th>
                                <th>Fecha</th>
                                <th>Archivo</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%
                                AgendarExamen ae = new AgendarExamen();
                                ArrayList<AgendarExamen> listar = g.listarEXAMLAB(ex);
                                if (listar.size() > 0) {
                                    for (AgendarExamen agE : listar) {
                                        ae = agE;
                            %>
                            <tr>
                                <td><%=ae.getaE()%></td>
                                <td><%=ae.getExamen()%></td>
                                <td><%=ae.getDoctor()%></td>
                                <td><%=ae.getPaciente()%></td>
                                <td><%=ae.getFecha()%></td>
                                <td>
                                    <%
                                        if (ae.getArchivo() != null) {
                                    %>
                                    <a href="../MostrarPDF?id=<%=ae.getaE()%>" target="_blank"><i class="fa fa-file-pdf-o fa-2x" aria-hidden="true" title="pdf"></i></a>
                                        <%
                                            } else {
                                                out.print("Sin PDF");
                                            }
                                        %>
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
        <br>
        <div class="container mt-5">
            <h3>Reporte de reporte de exámenes realizados en el día.</h3>
            <div class="row">
                <div class="col-sm">    
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
                                ArrayList<Resultado> list = g.listarREPORTEHOY(id);
                                if (list.size() > 0) {
                                    for (Resultado re : list) {
                                        r = re;
                            %>
                            <tr>
                                <td><%=r.getIdRslt()%></td>
                                <td><%=r.getIdAgex()%></td>
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
        <br>
        <h3>Reporte de utilización de cada día de trabajo, dentro de un intervalo de tiempo.</h3>
        <br>
        <div class="container mt-5">     
            <h3>Reporte de las 10 fechas con más trabajo realizado.</h3>
            <div class="row">
                <div class="col-sm">   
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">
                            <%
                                String sql5 = "SELECT fecha,COUNT(*) Total FROM RESULTADO WHERE id_laboratorista=? GROUP BY fecha HAVING COUNT(*)>=1 LIMIT 10;";
                                ps = cn.prepareStatement(sql5);
                                ps.setString(1, id);
                                rs = ps.executeQuery();
                            %>
                            <tr>
                                <th>Fecha</th>
                                <th>Cantidad Registros</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%                                try {
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString("fecha")%></td>
                                <td><%=rs.getInt("Total")%></td>
                            </tr> 
                            <%
                                    }
                                } catch (SQLException e) {
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <br>
    </body>
</html>
