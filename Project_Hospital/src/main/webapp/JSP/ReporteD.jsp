<%-- 
    Document   : ReporteD
    Created on : 7/10/2020, 16:06:18
    Author     : jara
--%>

<%@page import="Backend.Resultado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Backend.GestorDB"%>
<%@page import="Backend.Informe"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Backend.conexionDB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">          
        <title>Reportes Doctor</title>
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
            <h3>Cada médico tiene acceso al historial médico de los pacientes que estén dentro del portal.</h3>
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
                                Informe i = new Informe();
                                ArrayList<Informe> list = g.listarRESULTD();
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
                                ArrayList<Resultado> listar = g.listarEXAMREALIZADOCTOR();
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
            <h3>Reporte de citas agendadas en un intervalo de tiempo.</h3>
            <div class="row">
                <div class="col-sm">   
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="6" class="text-center"><h2>Ingrese las fechas del intervalo</h2></th>
                            </tr>
                            <tr>
                                <th colspan="6">
                                    <form>
                                        <input type="date" name="fecha1" placeholder="Fecha 1">
                                        <input type="date" name="fecha2" placeholder="Fecha 2">
                                        <input type="submit" class="btn btn-primary" value="Buscar">
                                    </form>
                                    <%
                                        String fecha1 = request.getParameter("fecha1");
                                        String fecha2 = request.getParameter("fecha2");
                                        String sql2 = "select * from CITA where fecha between ? AND ? order by fecha DESC;";
                                        ps = cn.prepareStatement(sql2);
                                        ps.setString(1, fecha1);
                                        ps.setString(2, fecha2);
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
        <div class="container mt-5">         
            <h3>Reporte de citas para el día en curso.</h3>
            <div class="row">
                <div class="col-sm">   
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="6" class="text-center"><h2>Citas disponibles para hoy</h2></th>                                
                                    <%
                                        String sql3 = "SELECT * FROM CITA WHERE fecha=curdate() AND id_doc=? ORDER BY hora ASC;";
                                        ps = cn.prepareStatement(sql3);
                                        ps.setString(1, id);
                                        rs = ps.executeQuery();
                                    %>
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
                                    System.out.println("Error al ver citas hoy: " + e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <br>
        <div class="container mt-5">  
            <h3>Los pacientes con mayor cantidad de informes médicos dentro de un intervalo de tiempo.</h3>
            <div class="row">
                <div class="col-sm">   
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="2" class="text-center"><h2>Ingrese las fechas del intervalo</h2></th>
                            </tr>
                            <tr>
                                <th colspan="2">
                                    <form>
                                        <input type="date" name="fecha11" placeholder="Fecha 1">
                                        <input type="date" name="fecha22" placeholder="Fecha 2">
                                        <input type="submit" class="btn btn-primary" value="Buscar">
                                    </form>
                                    <%
                                        String fecha11 = request.getParameter("fecha11");
                                        String fecha22 = request.getParameter("fecha22");
                                        String sql5 = "select id_pac,COUNT(*) Total from INFORME where fecha between ? AND ? GROUP BY id_pac HAVING COUNT(*)>=1;";
                                        ps = cn.prepareStatement(sql5);
                                        ps.setString(1, fecha11);
                                        ps.setString(2, fecha22);
                                        rs = ps.executeQuery();

                                    %>
                                </th>
                            </tr>
                            <tr>
                                <th>Paciente</th>
                                <th>Cantidad Registros</th>
                            </tr>6
                        </thead>
                        <tbody>         
                            <%                                try {
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getInt("id_pac")%></td>
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
