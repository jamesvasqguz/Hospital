<%-- 
    Document   : ReporteP
    Created on : 7/10/2020, 18:47:24
    Author     : jara
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="Backend.Cita"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Backend.Resultado"%>
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
        <title>Reportes Paciente</title>
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
        <%
            String id = String.valueOf(sesion.getAttribute("id"));
            int intid = Integer.parseInt(id);
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
            <h3>Últimos 5 exámenes de laboratorio realizados.</h3>
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
                                ArrayList<Resultado> listar = g.listarEXAMREALIZADOR(id);
                                if (listar.size() > 0) {
                                    for (Resultado re : listar) {
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
        <div class="container mt-5">   
            <h3>Exámenes realizados de un tipo en específico dentro de un intervalo de tiempo.</h3>
            <div class="row">
                <div class="col-sm">   
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="9" class="text-center"><h2>Ingrese Codigo del Examen y las fechas del intervalo</h2></th>
                            </tr>
                            <tr>
                                <th colspan="9">
                                    <form>
                                        <input type="text" name="exam" placeholder="Ingrese el Examen">
                                        <input type="date" name="fecha11" placeholder="Fecha 1">
                                        <input type="date" name="fecha22" placeholder="Fecha 2">
                                        <input type="submit" class="btn btn-primary" value="Buscar">
                                    </form>
                                    <%
                                        String exam = request.getParameter("exam");
                                        String fecha11 = request.getParameter("fecha11");
                                        String fecha22 = request.getParameter("fecha22");
                                        String sql1 = "SELECT distinct * FROM RESULTADO WHERE id_paciente=? AND id_examen=? AND fecha BETWEEN ? AND ? ORDER BY fecha DESC";
                                        ps = cn.prepareStatement(sql1);
                                        ps.setInt(1, intid);
                                        ps.setString(2, exam);
                                        ps.setString(3, fecha11);
                                        ps.setString(4, fecha22);
                                        rs = ps.executeQuery();
                                    %>
                                </th>
                            </tr>
                            <tr>
                                <th>ID Resultado</th>
                                <th>Examen Agendado</th>
                                <th>Paciente</th>
                                <th>Doctor</th>
                                <th>Examen</th>
                                <th>Laboratorista</th>
                                <th>Orden</th>
                                <th>Informe</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%                                try {
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getInt("id_resultado")%></td>
                                <td><%=rs.getInt("id_agex")%></td>
                                <td><%=rs.getInt("id_paciente")%></td>
                                <td><%=rs.getString("id_medico")%></td>
                                <td><%=rs.getString("id_examen")%></td>
                                <td><%=rs.getString("id_laboratorista")%></td>
                                <td><%=rs.getString("orden")%></td>
                                <td>
                                    <%
                                        if (rs.getBytes("informe") != null) {
                                    %>
                                    <a href="../MostrarARCH?id=<%=rs.getInt("id_resultado")%>&tipo=<%=rs.getString("orden")%>" target="_blank"><i class="fa fa-file-text-o fa-2x" aria-hidden="true" title="ARCHIVO"></i></a>
                                        <%
                                            } else {
                                                out.print("SIN ARCHIVO");
                                            }
                                        %>
                                </td>
                                <td><%=rs.getString("fecha")%></td>
                                <td><%=rs.getString("hora")%></td>
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
        <div class="container mt-5">
            <h3>Últimas 5 consultas realizadas.</h3>
            <div class="row">
                <div class="col-sm">    
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">            
                            <tr>
                                <th>Codigo Cita</th>
                                <th>Paciente</th>
                                <th>Doctor</th>
                                <th>Especialidad</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%
                                Cita ct = new Cita();
                                ArrayList<Cita> list = g.listarCITAREP(id);
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
            <h3>Consultas realizadas con un médico en específico dentro de un intervalo de tiempo.</h3>
            <div class="row">
                <div class="col-sm">   
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="6" class="text-center"><h2>Ingrese medico y las fechas del intervalo</h2></th>
                            </tr>
                            <tr>
                                <th colspan="6">
                                    <form>
                                        <input type="text" name="med" placeholder="Ingrese el Medico">
                                        <input type="date" name="fecha1" placeholder="Fecha 1">
                                        <input type="date" name="fecha2" placeholder="Fecha 2">
                                        <input type="submit" class="btn btn-primary" value="Buscar">
                                    </form>
                                    <%
                                        String med = request.getParameter("med");
                                        String fecha1 = request.getParameter("fecha1");
                                        String fecha2 = request.getParameter("fecha2");
                                        String sql = "SELECT distinct id_cita,id_pacnt,id_doc,especialidad,fecha,hora FROM CITA WHERE id_pacnt=? AND id_doc=? AND fecha BETWEEN ? AND ? ORDER BY fecha DESC";
                                        ps = cn.prepareStatement(sql);
                                        ps.setInt(1, intid);
                                        ps.setString(2, med);
                                        ps.setString(3, fecha1);
                                        ps.setString(4, fecha2);
                                        rs = ps.executeQuery();
                                    %>
                                </th>
                            </tr>
                            <tr>
                                <th>ID Cita</th>
                                <th>Paciente</th>
                                <th>Doctor</th>
                                <th>Especialidad</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%                                try {
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getInt("id_cita")%></td>
                                <td><%=rs.getInt("id_pacnt")%></td>
                                <td><%=rs.getString("id_doc")%></td>
                                <td><%=rs.getString("especialidad")%></td>
                                <td><%=rs.getString("fecha")%></td>
                                <td><%=rs.getString("hora")%></td>
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
