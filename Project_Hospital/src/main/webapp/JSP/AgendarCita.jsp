<%-- 
    Document   : AgendarCita
    Created on : 27/09/2020, 06:10:33
    Author     : jara
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Backend.conexionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">      
        <title>Agendar Cita</title>
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
        <%
            Connection cn = null;
            cn = conexionDB.conector();
            PreparedStatement ps = null;
            PreparedStatement ps1 = null;
            ResultSet rs = null;
            ResultSet rs1 = null;
            String sql = "SELECT D.id_doctor, D.nombre, D.colegiado, D.correo, D.hora_inicio, D.hora_fin, E.tipo_especialidad FROM DOCTOR D INNER JOIN ESPECIALIDAD E ON D.id_doctor=E.id_doctor;";
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            String sql2 = "SELECT * FROM CITA WHERE fecha=curdate() ORDER BY hora ASC;";
            ps1 = cn.prepareStatement(sql2);
            rs1 = ps1.executeQuery();
        %>
        <div class="container mt-5">         
            <div class="row">
                <div class="col-sm">   
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="4" class="text-center"><h2>Medicos Disponibles</h2></th>
                                <th colspan="3">
                                    <form>
                                        <input type="text" name="txtbuscar" placeholder="Filtrar Medico/Especialidad">
                                        <input type="submit" class="btn btn-primary" value="Buscar">
                                    </form>
                                    <%
                                        String nombre = request.getParameter("txtbuscar");
                                        if (nombre != null) {
                                            String sql1 = "SELECT D.id_doctor, D.nombre, D.colegiado, D.correo, D.hora_inicio, D.hora_fin, E.tipo_especialidad FROM DOCTOR D INNER JOIN ESPECIALIDAD E ON D.id_doctor=E.id_doctor AND (D.nombre LIKE" + "'%" + nombre + "%' OR E.tipo_especialidad LIKE" + "'%" + nombre + "%')";
                                            ps = cn.prepareStatement(sql1);
                                            rs = ps.executeQuery();
                                        }
                                    %>
                                </th>
                            </tr>
                            <tr>
                                <th>Codigo</th>
                                <th>Doctor</th>
                                <th>Colegiado</th>
                                <th>Correo</th>
                                <th>Inicia labores</th>
                                <th>Termina labores</th>
                                <th>Especialidad</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%
                                try {
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString("D.id_doctor")%></td>
                                <td><%=rs.getString("D.nombre")%></td>
                                <td><%=rs.getString("D.colegiado")%></td>
                                <td><%=rs.getString("D.correo")%></td>
                                <td><%=rs.getString("D.hora_inicio")%></td>
                                <td><%=rs.getString("D.hora_fin")%></td>
                                <td><%=rs.getString("E.tipo_especialidad")%></td>
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
        <div class="container mt-5">         
            <div class="row">
                <div class="col-sm">   
                    <table class="table table-bordered table-striped">                      
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="2" class="text-center"><h2>Citas disponibles para hoy</h2></th>
                                <th colspan="2">
                                    <form>
                                        <input type="text" name="txtcita" placeholder="Ver citas del medico Hoy">
                                        <input type="submit" class="btn btn-primary" value="Buscar">
                                    </form>
                                    <%
                                        String nombre2 = request.getParameter("txtcita");
                                        if (nombre2 != null) {
                                            String sql4 = "SELECT id_doc, especialidad, fecha, hora FROM CITA WHERE fecha=curdate() AND id_doc LIKE" + "'%" + nombre2 + "%' ORDER BY hora ASC;";
                                            ps1 = cn.prepareStatement(sql4);
                                            rs1 = ps1.executeQuery();
                                        }
                                    %>
                                </th>
                            </tr>
                            <tr>
                                <th>Doctor</th>
                                <th>Especialidad</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                            </tr>
                        </thead>
                        <tbody>         
                            <%
                                try {
                                    while (rs1.next()) {
                            %>
                            <tr>
                                <td><%=rs1.getString("id_doc")%></td>
                                <td><%=rs1.getString("especialidad")%></td>
                                <td><%=rs1.getString("fecha")%></td>
                                <td><%=rs1.getString("hora")%></td>
                            </tr> 
                            <%
                                    }
                                    conexionDB.cerrar();
                                } catch (SQLException e) {
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <h1>Agenda una cita!</h1>          
            <h4>Si el registro es exitoso, lo redigira a sus consultas.</h4>
            <h4>Si el registro falla, recargara la pagina actual.</h4>
            <div class="row">
                <div class="col-sm">
                    <form action="/Project_Hospital/RegistrarCita" method="post">
                        <div class="form-group">
                            <label>ID</label>
                            <input type="text" class="form-control" name="id" value="<%=sesion.getAttribute("id")%>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Medico</label>
                            <input type="text" class="form-control" name="doc" placeholder="Ingrese el ID del Medico de su eleccion" required>
                        </div>
                        <div class="form-group">
                            <label>Especialidad</label>
                            <input type="text" class="form-control" name="espe" placeholder="Ingrese la Especialidad de la Consulta" required>
                        </div>
                        <div class="form-group">
                            <label>Fecha</label>
                            <input type="date" class="form-control" name="fecha" required>
                        </div>
                        <div class="form-group">
                            <label>Seleccione la hora de la consulta</label>
                            <br>
                            <label>Recuerde la hora que seleccione debe estar entre la hora de atencion del medico</label>
                            <br>
                            <input type="time" name="horaC" list="listahorasdeseadas">
                            <datalist id="listahorasdeseadas">
                                <option value="00:00">
                                <option value="01:00">
                                <option value="02:00">
                                <option value="03:00">
                                <option value="04:00">
                                <option value="05:00">
                                <option value="06:00">
                                <option value="07:00">
                                <option value="08:00">
                                <option value="09:00">
                                <option value="10:00">
                                <option value="11:00">
                                <option value="12:00"> 
                                <option value="13:00">
                                <option value="14:00">
                                <option value="15:00">
                                <option value="16:00">
                                <option value="17:00">
                                <option value="18:00">
                                <option value="19:00">
                                <option value="20:00">
                                <option value="21:00">
                                <option value="22:00">
                                <option value="23:00">
                            </datalist>
                        </div>
                        <button type="submit" class="btn btn-primary" name="entrar">Agendar Cita</button>
                        <a href="Paciente.jsp" class="btn btn-danger">Regresar</a>
                    </form>
                    <br>
                    <br>
                </div>
            </div>
        </div> 
    </body>
</html>
