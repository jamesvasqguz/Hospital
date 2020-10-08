<%-- 
    Document   : AgendarExamen
    Created on : 27/09/2020, 06:11:04
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">      
        <title>Agendar Examen</title>
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
            <div class="row">
                <div class="col-sm">    
                    <h5>Examenes de Laboratorio Disponibles</h5>
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">            
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Requiere Orden</th>
                                <th>Descripcion</th>
                                <th>Costo</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%
                                Connection cn = null;
                                cn = conexionDB.conector();
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                try {
                                    String sql = "SELECT * FROM EXAMEN;";
                                    ps = cn.prepareStatement(sql);
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString("id_examen")%></td>
                                <td><%=rs.getString("nombre")%></td>
                                <%if (rs.getBoolean("orden")) {
                                    %>
                                <td>SI</td>
                                <%
                                    }else if(!(rs.getBoolean("orden"))){
                                    %>
                                <td>NO</td>
                                <%
                                    }
                                %>
                                
                                <td><%=rs.getString("descripcion")%></td>
                                <td><%=rs.getDouble("costo")%></td>
                            </tr> 
                            <%
                                    }
                                    conexionDB.cerrar();
                                } catch (Exception e) {
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <h1>Complete el formulario para agendar tu examen</h1>
            <h4>Si el registro es exitoso, lo redigira a Principal.</h4>
            <h4>Si el registro falla, recargara el Formulario.</h4>
            <div class="row">
                <div class="col-sm">        
                    <form action="/Project_Hospital/AgendarExam" method="post">
                        <div class="form-group">
                            <label>Codigo Examen</label>
                            <input type="text" class="form-control" name="codigo" placeholder="Ingrese el Codigo del Examen" required>
                        </div>
                        <div class="form-group">
                            <label>Ingrese su ID</label>
                            <input type="text" class="form-control" name="id" value="<%=sesion.getAttribute("id")%>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Ingrese la Fecha que desea realizarlo</label>
                            <input type="date" class="form-control" name="fecha" required>
                        </div>
                        <button type="submit" class="btn btn-primary" name="entrar">Agendar Examen</button>
                        <a href="Paciente.jsp" class="btn btn-danger">Regresar</a>
                    </form>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
