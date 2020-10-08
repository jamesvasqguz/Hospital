<%-- 
    Document   : CerrarSesion
    Created on : 15/09/2020, 23:52:29
    Author     : jara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar Sesion</title>
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        sesion.invalidate();
        response.sendRedirect("UserLogin.jsp");
        %>
    </body>
</html>
