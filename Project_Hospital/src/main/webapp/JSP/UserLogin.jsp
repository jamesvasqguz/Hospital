<%-- 
    Document   : UserLogin
    Created on : 14/09/2020, 17:08:00
    Author     : jara
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">      
        <title>Inicio de sesion</title>
    </head>
    <body>
        <%@ page import="Controladores.InicioS" %>
        <div class="container mt-5">
            <h1>HOSPITAL REGIONAL DE OCCIDENTE</h1>  
            <h3>Complete el formulario de inicio de sesion</h3>
            <div class="row">
                <div class="col-sm">
                    <form action="/Project_Hospital/InicioS" method="post">
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="usuario" placeholder="Ingrese su codigo de usuario" required>
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" name="pass" placeholder="Ingrese su contraseña" required>
                        </div>
                        <button type="submit" class="btn btn-primary" name="listo">Ingresar</button>
                        <br>
                        <br>
                    </form>
                    <a href="NuevoPaciente.jsp" class="btn btn-primary" >Registrarse en el Sistema(Solo para pacientes)</a></p>
                </div>
            </div>
        </div>
    </body>
</html>
