<%-- 
    Document   : ReporteA
    Created on : 8/10/2020, 08:56:37
    Author     : jara
--%>

<%@page import="java.sql.SQLException"%>
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
        <title>Reportes</title>
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
                            <a class="nav-link" href="Admin.jsp">Principal</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Agregar Empleados
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="CreacionUA.jsp">Administradores</a>
                                <a class="dropdown-item" href="CreacionUD.jsp">Doctores</a>
                                <a class="dropdown-item" href="CreacionUL.jsp">Laboratoristas</a>                              
                                <div class="dropdown-divider"></div>
                            </div>
                        </li>                      
                        <li class="nav-item">
                            <a class="nav-link" href="CrearExamen.jsp" >Crear Examenes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MostrarExamenes.jsp">Editar Examenes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CrearConsulta.jsp">Consultas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ReporteA.jsp">Mis Reportes</a>
                        </li>                 
                    </ul>
                    <form class="form-inline my-2 my-lg-0" action="CerrarSesion.jsp">
                        <button class="btn btn-danger my-2 my-sm-0" type="submit">Salir</button>
                    </form>
                </div>
            </nav>
        </div>
        <div class="container mt-5">  
            <h3>Los 10 médicos que más informes han realizado dentro de un intervalo de tiempo.</h3>
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
                                        <input type="date" name="fecha1" placeholder="Fecha 1">
                                        <input type="date" name="fecha2" placeholder="Fecha 2">
                                        <input type="submit" class="btn btn-primary" value="Buscar">
                                    </form>
                                    <%
                                        String fecha1 = request.getParameter("fecha1");
                                        String fecha2 = request.getParameter("fecha2");
                                        String sql = "SELECT id_dct,COUNT(*) Total FROM INFORME WHERE fecha between ? AND ? GROUP BY id_dct HAVING COUNT(*)>=1 LIMIT 10;";
                                        ps = cn.prepareStatement(sql);
                                        ps.setString(1, fecha1);
                                        ps.setString(2, fecha2);
                                        rs = ps.executeQuery();

                                    %>
                                </th>
                            </tr>
                            <tr>
                                <th>Medico</th>
                                <th>Cantidad Informe</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%                                try {
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString("id_dct")%></td>
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
        <div class="container mt-5">  
            <h3>Ingresos obtenidos por médico en un intervalo de tiempo.</h3>
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
                                        <input type="date" name="fecha11" placeholder="Fecha 11">
                                        <input type="date" name="fecha22" placeholder="Fecha 22">
                                        <input type="submit" class="btn btn-primary" value="Buscar">
                                    </form>
                                    <%
                                        String fecha11 = request.getParameter("fecha11");
                                        String fecha22 = request.getParameter("fecha22");
                                        String sql1 = "SELECT id_dct,COUNT(*) Total FROM INFORME WHERE fecha between ? AND ? GROUP BY id_dct HAVING COUNT(*)>=1 LIMIT 10;";
                                        ps = cn.prepareStatement(sql1);
                                        ps.setString(1, fecha11);
                                        ps.setString(2, fecha22);
                                        rs = ps.executeQuery();

                                    %>
                                </th>
                            </tr>
                            <tr>
                                <th>Medico</th>
                                <th>Cantidad Informe</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%                                try {
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString("id_dct")%></td>
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
        <div class="container mt-5">  
            <h3>Los 5 médicos con menor cantidad de citas dentro de un intervalo de tiempo.</h3>
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
                                        <input type="date" name="fecha111" placeholder="Fecha 111">
                                        <input type="date" name="fecha222" placeholder="Fecha 222">
                                        <input type="submit" class="btn btn-primary" value="Buscar">
                                    </form>
                                    <%
                                        String fecha111 = request.getParameter("fecha111");
                                        String fecha222 = request.getParameter("fecha222");
                                        String sql3 = "SELECT id_dct,COUNT(*) Total FROM INFORME WHERE fecha between ? AND ? GROUP BY id_dct HAVING COUNT(*)>=1 ORDER BY Total ASC LIMIT 5 ;";
                                        ps = cn.prepareStatement(sql3);
                                        ps.setString(1, fecha111);
                                        ps.setString(2, fecha222);
                                        rs = ps.executeQuery();

                                    %>
                                </th>
                            </tr>
                            <tr>
                                <th>Medico</th>
                                <th>Cantidad Informe</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%                                try {
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString("id_dct")%></td>
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
        <div class="container mt-5">  
            <h3>Los exámenes de laboratorio más demandados en un intervalo de tiempo.</h3>
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
                                        <input type="date" name="fecha1111" placeholder="Fecha 1111">
                                        <input type="date" name="fecha2222" placeholder="Fecha 2222">
                                        <input type="submit" class="btn btn-primary" value="Buscar">
                                    </form>
                                    <%
                                        String fecha1111 = request.getParameter("fecha1111");
                                        String fecha2222 = request.getParameter("fecha2222");
                                        String sql4 = "SELECT id_exam,COUNT(*) Total FROM AGENDAR_EXAMEN WHERE fecha between ? AND ? GROUP BY id_exam HAVING COUNT(*)>=1 ORDER BY Total DESC;";
                                        ps = cn.prepareStatement(sql4);
                                        ps.setString(1, fecha1111);
                                        ps.setString(2, fecha2222);
                                        rs = ps.executeQuery();

                                    %>
                                </th>
                            </tr>
                            <tr>
                                <th>Examen</th>
                                <th>Cantidad Demanda</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%                                try {
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString("id_exam")%></td>
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
        <h3>Los médicos con mayor cantidad de exámenes de laboratorio requeridos, incluyendo los 3 exámenes que más ha requerido en un intervalo de tiempo.</h3>
        <h3>Ingresos generados por paciente en un intervalo de tiempo.</h3>
    </body>
</html>
