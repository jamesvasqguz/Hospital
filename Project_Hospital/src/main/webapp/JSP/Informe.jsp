<%-- 
    Document   : Informe
    Created on : 6/10/2020, 05:58:45
    Author     : jara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">      
        <title>Reporte Medico</title>
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
            <h1>Reporte</h1>
            <div class="row">
                <div class="col-sm">
                    <form action="/Project_Hospital/Reporte" method="post">
                        <div class="form-group">
                            <label>ID Paciente</label>
                            <input type="text" class="form-control" name="paciente" value="<%=request.getParameter("pac")%>" readonly >
                        </div>
                        <div class="form-group">
                            <label>ID Doctor</label>
                            <input type="text" class="form-control" name="doctor" value="<%=sesion.getAttribute("id")%>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Informe de Consulta</label>
                            <input type="text" class="form-control" name="info" placeholder="Ingrese el informe de la consulta" required>
                        </div>
                        <div class="form-group">
                            <label>Fecha</label>
                            <input type="date" class="form-control" name="fecha" value="<%=request.getParameter("fecha")%>" required>
                        </div>
                        <div class="form-group">
                            <label>Hora</label>
                            <input type="time" class="form-control" name="hora" value="<%=request.getParameter("hora")%>" required>
                        </div>
                        <br>
                        <h1>Si no necesita agendar un examen omita estos pasos</h1>
                        <h3>Agenda un Examen para el Paciente</h3>
                        <div class="form-group">
                            <label>ID Examen</label>
                            <input type="text" class="form-control" name="exam" placeholder="Ingrese el codigo del Examen">
                        </div>
                        <div class="form-group">
                            <label>Fecha del Examen</label>
                            <input type="date" class="form-control" name="fecha2">
                        </div>
                        <br>
                        <h1>Si no necesita agendar una siguiente cita omita estos pasos</h1>
                        <h3>Agenda una nueva Cita</h3>
                        <div class="form-group">
                            <label>Especialidad</label>
                            <input type="text" class="form-control" name ="espe" value="<%=request.getParameter("esp")%>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Fecha de la Siguiente Cita</label>
                            <input type="date" class="form-control" name="fecha3">
                        </div>
                        <div class="form-group">
                            <label>Seleccione la hora de la consulta</label>
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
                        <br>
                        <button type="submit" class="btn btn-success" name="entrar">Realizar Informe</button>
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
