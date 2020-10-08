<%-- 
    Document   : CreacionUP
    Created on : 20/09/2020, 05:31:58
    Author     : jara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">       
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">      
        <title>Codigo Ingreso</title>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <div class="alert alert-success" role="alert">
                        <h1 class="alert-heading">Te haz registrado correctamente</h1>
                        <h3>Para ingresar al sistema debes iniciar sesion</h3>
                        <h3><%=request.getAttribute("ID")%></h3>
                    </div>          
                    <a href="JSP/UserLogin.jsp" class="btn btn-primary">Iniciar Sesion</a>
                </div>
            </div>
        </div>
    </body>
</html>
