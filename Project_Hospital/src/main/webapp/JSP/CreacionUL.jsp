<%-- 
    Document   : CreacionUL
    Created on : 21/09/2020, 03:45:35
    Author     : jara
--%>
<%@page import="Backend.conexionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">          
        <title>Crear Laboratorista</title>
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
            <div class="row">
                <div class="col-sm">    
                    <h5>Examenes de Laboratorio Disponibles</h5>
                    <table class="table table-bordered table-striped">                      
                        <thead>            
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Orden</th>
                                <th>Descripcion</th>
                                <th>Costo</th>
                                <th>Tipo Informe</th>
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
                                <td><%=rs.getBoolean("orden")%></td>
                                <td><%=rs.getString("descripcion")%></td>
                                <td><%=rs.getDouble("costo")%></td>
                                <td><%=rs.getString("tipo_informe")%></td>
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
            <h1>Complete el formulario para Registrar al Laboratorista!</h1>
            <h4>Si el registro es exitoso, lo redigira a Principal.</h4>
            <h4>Si el registro falla, recargara el Formulario.</h4>
            <div class="row">
                <div class="col-sm">        
                    <form action="/Project_Hospital/RegistrarL" method="post">
                        <div class="form-group">
                            <label>Codigo Laboratorista</label>
                            <input type="text" class="form-control" name="codigo" placeholder="Ingrese el Codigo del Laboratorista" required>
                        </div>
                        <div class="form-group">
                            <label>Nombre Completo</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Ingrese su Nombre Completo" required>
                        </div>
                        <div class="form-group">
                            <label>Registro</label>
                            <input type="text" class="form-control" name="registro" placeholder="Ingrese el Registro del Laboratorista" required>
                        </div>
                        <div class="form-group">
                            <label>DPI</label>
                            <input type="text" class="form-control" name="dpi" placeholder="Ingrese el DPI del Laboratorista" required>
                        </div>  
                        <div class="form-group">
                            <label>Telefono</label>
                            <input type="text" class="form-control" name="telefono" placeholder="Ingrese el numero de Telefono" required>
                        </div>
                        <div class="form-group">
                            <label>Examen</label>
                            <input type="text" class="form-control" name="examen" placeholder="Ingrese el Codigo del Examen" required>                        
                        </div>
                        <div class="form-group">
                            <label>Correo Electronico</label>
                            <input type="email" class="form-control" name="correo" placeholder="Ingrese el Correo Electronico" required>
                        </div>
                        <div class="form-group">
                            <label>Seleccione los dias que trabaja el Laboratorista:</label>
                            <br>
                            <input type="checkbox" name="diad" value="Domingo">Domingo <br>
                            <input type="checkbox" name="dial" value="Lunes">Lunes <br>
                            <input type="checkbox" name="diama" value="Martes">Martes <br>
                            <input type="checkbox" name="diami" value="Miercoles">Miercoles <br>
                            <input type="checkbox" name="diaj" value="Jueves">Jueves <br>
                            <input type="checkbox" name="diav" value="Viernes">Viernes <br>
                            <input type="checkbox" name="dias" value="Sabado">Sabado <br>
                        </div>
                        <div class="form-group">
                            <label>Fecha en la que Inicio a Trabajar</label>
                            <input type="date" class="form-control" name="fecha" required>
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" name="pass" placeholder="Ingrese la contraseña" required>
                        </div>
                        <button type="submit" class="btn btn-primary" name="entrar">Crear Laboratorista</button>
                        <a href="Admin.jsp" class="btn btn-danger">Regresar</a>
                    </form>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
