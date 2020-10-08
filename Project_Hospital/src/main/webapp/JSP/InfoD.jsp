<%-- 
    Document   : InfoD
    Created on : 5/10/2020, 11:43:52
    Author     : jara
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Backend.conexionDB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">            
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Personales</title>
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
                            <a class="nav-link" href="">Examenes Realizado con Orden</a>
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
            <h1>Datos Personales</h1>
            <h3>Puede modificar todo a excepcion de su ID</h3>
            <div class="row">
                <div class="col-sm">
                    <form action="/Project_Hospital/UpdateD" method="post">
                        <%
                            Connection cn = null;
                            cn = conexionDB.conector();
                            PreparedStatement ps = null;
                            ResultSet rs = null;
                            String sql = "SELECT D.id_doctor, D.nombre, D.colegiado, D.dpi, D.telefono, D.correo, D.hora_inicio, D.hora_fin, D.fecha_inicio, U.id_user, U.pass FROM DOCTOR D INNER JOIN USUARIO U ON D.id_doctor='" + sesion.getAttribute("id") + "' AND U.id_user='" + sesion.getAttribute("id") + "';";
                            try {
                                ps = cn.prepareStatement(sql);
                                rs = ps.executeQuery();
                                if (rs.next()) {
                        %>
                        <div class="form-group">
                            <label>ID</label>
                            <input type="text" class="form-control" name="id" value="<%=sesion.getAttribute("id")%>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Nombre Completo</label>
                            <input type="text" class="form-control" name="nombre" value="<%=rs.getString("D.nombre")%>">
                        </div>
                        <div class="form-group">
                            <label>Colegiado</label>
                            <input type="text" class="form-control" name="cole" value="<%=rs.getString("D.colegiado")%>">
                        </div>
                        <div class="form-group">
                            <label>DPI</label>
                            <input type="text" class="form-control" name="dpi" value="<%=rs.getString("D.dpi")%>">
                        </div>
                        <div class="form-group">
                            <label>Telefono</label>
                            <input type="text" class="form-control" name="telefono" value="<%=rs.getString("D.telefono")%>">
                        </div>
                        <div class="form-group">
                            <label>Correo Electronico</label>
                            <input type="text" class="form-control" name="correo" value="<%=rs.getString("D.correo")%>">
                        </div>
                        <div class="form-group">
                            <label>Hora Inicio</label>
                            <input type="time" class="form-control" name="horaI" value="<%=rs.getString("D.hora_inicio")%>">
                        </div>
                        <div class="form-group">
                            <label>Hora Fin</label>
                            <input type="time" class="form-control" name="horaF" value="<%=rs.getString("D.hora_fin")%>">
                        </div>
                        <div class="form-group">
                            <label>Fecha Inicio</label>
                            <input type="date" class="form-control" name="fecha" value="<%=rs.getString("D.fecha_inicio")%>">
                        </div>
                        <div class="form-group">
                            <label>Nueva Contraseña</label>
                            <br>
                            <label>Si no va cambiar su contraseña omita este paso</label>
                            <input type="password" class="form-control" name="pass" placeholder="Ingrese su nueva contraseña">
                        </div>
                        <%
                                }
                            } catch (Exception e) {
                                out.println("Error al actualizar");
                                System.out.println("Error al obtener info del paciente");
                            }
                        %>
                        <button type="submit" class="btn btn-primary" name="entrar">Actualizar Datos</button>
                        <a href="Doctor.jsp" class="btn btn-danger">Cancelar</a>
                    </form>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
