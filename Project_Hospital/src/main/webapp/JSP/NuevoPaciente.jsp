<%-- 
    Document   : NuevoPaciente
    Created on : 14/09/2020, 17:11:19
    Author     : jara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">      
        <title>Registro Paciente</title>
    </head>
    <body>
        <div class="container mt-5">
            <h1>Complete el formulario de Registro</h1>
            <div class="row">
                <div class="col-sm">
                    <form action="/Project_Hospital/RegistrarP" method="post">
                        <div class="form-group">
                            <label>Nombre Completo</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Ingrese su Nombre Completo" required>
                        </div>
                        <div class="form-group">
                            <label>Sexo:</label>
                            <select class="form-control form-control-sm" name="sexo" required="Tiene que seleccionar">
                                <option value="Hombre">Hombre</option>
                                <option value="Mujer">Mujer</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Fecha de Nacimiento</label>
                            <input type="date" class="form-control" name="fecha" placeholder="Año-Mes-Dia" required>
                        </div>
                        <div class="form-group">
                            <label>DPI:</label>
                            <input type="text" class="form-control" name="dpi" placeholder="Ingrese su numero de DPI" required>
                        </div>
                        <div class="form-group">
                            <label>Telefono:</label>
                            <input type="text" class="form-control" name="telefono" placeholder="Ingrese su numero de Telefono" required>
                        </div>
                        <div class="form-group">
                            <label>Peso (kg):</label>
                            <input type="text" class="form-control" name="peso" placeholder="Ingrese su Peso" required>
                        </div>
                        <div class="form-group">
                            <label>Tipo de Sangre:</label>
                            <input type="text" class="form-control" name="tipo" placeholder="Ingrese su Tipo de Sangre" required>
                        </div>
                        <div class="form-group">
                            <label>Correo Electronico:</label>
                            <input type="email" class="form-control" id="email" name="correo" placeholder="Ingrese su Correo Electronico" required>
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" name="pass" placeholder="Ingrese su contraseña" required>
                        </div>
                        <button type="submit" class="btn btn-primary" name="entrar">Registrarse</button>
                        <a href="UserLogin.jsp" class="btn btn-danger">Cancelar</a>
                    </form>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
