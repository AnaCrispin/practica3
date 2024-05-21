<%@page import="com.emergentes.Estudiante"%>
<%@page import="java.util.ArrayList" %>
<%
    if (session.getAttribute("listaest") == null) {
        ArrayList<Estudiante> lisaux = new ArrayList<Estudiante>();
        session.setAttribute("listaest", lisaux);
    }
    ArrayList<Estudiante> lista = (ArrayList<Estudiante>) session.getAttribute("listaest");
%>      

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Seminario</title>
        <style>
            body {
                text-align: center;
            }
            .encabezado {
                border: 2px solid black;
                padding: 10px;
                margin: 20px auto; /* Centra el recuadro horizontalmente */
                width: 50%; /* Ancho del recuadro */
            }
            .tabla {
                margin: 20px auto; /* Centra la tabla horizontalmente */
                width: 80%; /* Ancho de la tabla */
                border-collapse: collapse;
            }
            .tabla th, .tabla td {
                border: 1px solid black;
                padding: 8px;
            }
            .contenedor-botones {
                text-align: left; /* Para alinear los botones hacia la derecha */
                margin-left: 120px;
            }
        </style>
         <style>
        .resaltado {
            font-weight: bold;
            border: 2px solid black;
            padding: 10px;
            display: inline-block;
        }
    </style>
    </head>
    <body>
        <p class="resaltado"> Ana Cristina Mamani Quispe</p>
        <div class="encabezado">
            
            <h1>Lista de Reguistros</h1>
        </div>

        <div class="contenedor-botones">
            <button  onclick="window.location.href = 'MainServlet?op=nuevo'">Nuevo registro</button>
        </div>



        <table class="tabla" border="1" >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Fecha</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Turno</th>
                    <th>Seminario</th>
                    <th>Editar Estudiante</th>
                    <th>Eliminar Estudiante</th>
                </tr>
                <%
                    if (lista != null) {
                        for (Estudiante item : lista) {

                %>
                <tr>
                    <td><%= item.getId()%></td>
                    <td><%= item.getFecha()%></td>
                    <td><%= item.getNombre()%></td>
                    <td><%= item.getApellidos()%></td>
                    <td><%= item.getTurno()%></td>
                    <td><%= item.getSeminario()%></td>

                    <td>
                        <a href="MainServlet?op=editar&id=<%= item.getId()%>" onclick="cambiarTextoEncabezado()">Editar</a>
                    </td>
                    <td>
                        <a href="MainServlet?op=eliminar&id=<%= item.getId()%>"
                           onclick="return (confirm('Esta seguro de eliminar??'))" >Eliminar</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
           
    </body>
</html>
