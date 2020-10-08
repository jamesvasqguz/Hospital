<%-- 
    Document   : CreacionUD
    Created on : 21/09/2020, 03:45:11
    Author     : jara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">      
        <title>Crear Doctor</title>
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
            <h1>Complete el formulario para Registrar al Doctor!</h1>
            <h4>Si el registro es exitoso, lo redigira a Principal.</h4>
            <h4>Si el registro falla, recargara el Formulario.</h4>
            <div class="row">
                <div class="col-sm">
                    <form action="/Project_Hospital/RegistrarD" method="post">
                        <div class="form-group">
                            <label>Codigo Doctor</label>
                            <input type="text" class="form-control" name="codigo" placeholder="Ingrese el Codigo del Doctor" required>
                        </div>
                        <div class="form-group">
                            <label>Nombre Completo</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Ingrese su Nombre Completo" required>
                        </div>
                        <div class="form-group">
                            <label>Colegiado</label>
                            <input type="text" class="form-control" name="colegiado" placeholder="Ingrese el colegiado del Doctor" required>
                        </div>
                        <div class="form-group">
                            <label>DPI</label>
                            <input type="text" class="form-control" name="dpi" placeholder="Ingrese el DPI del Doctor" required>
                        </div>  
                        <div class="form-group">
                            <label>Telefono</label>
                            <input type="text" class="form-control" name="telefono" placeholder="Ingrese el numero de Telefono" required>
                        </div>
                        <div class="form-group">
                            <label>Especialidades</label>
                            <br>
                            <textarea name="especialidades" rows="3" cols="122" placeholder="Ingrese las especialidades separadas por (,)" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Correo Electronico</label>
                            <input type="email" class="form-control" id="email" name="correo" placeholder="Ingrese el Correo Electronico" required>
                        </div>
                        <div class="form-group">
                            <label>Fecha de Inicio de Trabajo</label>
                            <input type="date" class="form-control" name="fecha" required>
                        </div>
                        <div class="form-group">
                            <label>Hora de Ingreso</label>
                            <input type="time" class="form-control" name="hora1" required>
                        </div>
                        <div class="form-group">
                            <label>Hora de Egreso</label>
                            <input type="time" class="form-control" name="hora2" required>
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" name="pass" placeholder="Ingrese la contraseña" required>
                        </div>
                        <button type="submit" class="btn btn-primary" name="entrar">Crear Doctor</button>
                        <a href="Admin.jsp" class="btn btn-danger">Regresar</a>
                    </form>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
