<%-- 
    Document   : RealizarExamen
    Created on : 6/10/2020, 18:23:24
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
        <title>Realizar Examen</title>
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
        <%
            Connection cn = null;
            cn = conexionDB.conector();
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                String sql = "SELECT tipo_informe FROM EXAMEN WHERE id_examen=?;";
                ps = cn.prepareStatement(sql);
                ps.setString(1, request.getParameter("exam"));
                rs = ps.executeQuery();
                if (rs.next()) {
        %>
        <div class="container mt-5">
            <h1>Realizar Examen</h1>
            <div class="row">
                <div class="col-sm">
                    <form action="/Project_Hospital/Resultado" method="post">
                        <div class="form-group">
                            <label>Codigo de Examen Agendado</label>
                            <input type="text" class="form-control" name="agex" value="<%=request.getParameter("agex")%>" readonly >
                        </div>
                        <div class="form-group">
                            <label>ID Paciente</label>
                            <input type="text" class="form-control" name="pac" value="<%=request.getParameter("pac")%>" readonly >
                        </div>
                        <div class="form-group">
                            <label>ID Medico</label>
                            <input type="text" class="form-control" name="med" value="<%=request.getParameter("med")%>" readonly >
                        </div>
                        <div class="form-group">
                            <label>ID Examen</label>
                            <input type="text" class="form-control" name="exam" value="<%=request.getParameter("exam")%>" readonly >
                        </div>
                        <div class="form-group">
                            <label>ID Laboratorista</label>
                            <input type="text" class="form-control" name="lab" value="<%=sesion.getAttribute("id")%>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Orden</label>
                            <input type="text" class="form-control" name="info" value="<%=rs.getString("tipo_informe")%>" readonly>
                        </div>

                        <br>
                        <div class="form-group">
                            <label>Archivo</label>
                            <select class="form-control form-control-sm" name="file" required="Tiene que seleccionar">
                                <%
                                    if ((rs.getString("tipo_informe").equals("PDF"))) {
                                %>
                                <option value=".pdf">PDF</option>
                                <%
                                } else if ((rs.getString("tipo_informe")).equals("IMG")) {
                                %>
                                <option value = ".png">PNG</option> 
                                <option value = ".jpg">JPG</option> 
                                <option value = ".gif">GIF</option >
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <%
                                }
                                conexionDB.cerrar();
                            } catch (Exception e) {
                            }
                        %>
                        <div class="form-group">
                            <label>Fecha</label>
                            <input type="text" class="form-control" name="fecha" value="<%=request.getParameter("fecha")%>" readonly >
                        </div>
                        <div class="form-group">
                            <label>Hora en que se Realiza el Examen</label>
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
                        <button type="submit" class="btn btn-success" name="entrar">Realizar Examen</button>
                        <br>
                        <br>
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
