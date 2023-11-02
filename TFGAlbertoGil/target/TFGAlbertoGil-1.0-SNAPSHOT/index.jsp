<%-- 
    Document   : index
    Created on : 24 oct 2023, 12:46:05
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="login.jsp">Login</a></li>
                 </ul>
            </nav>
        </header>
        <div>
            <h1>Register</h1>
            <form action="UserServlet" method="POST" >
                <p><label>Nombre</label><input type="text" name="name" required></p>
                <p><label>Apellidos</label><input type="text" name="surname" required></p>
                <p><label>Telefono</label><input type="tel" name="telf" pattern="\d{9}" required></p>
                <p><label>Email</label><input type="email" name="mail" required></p>
                <p><label>Contraseña</label><input type="password" name="pwd" required></p>
                <p><label>Repetir contraseña</label><input type="password" name="pwd2" required></p>
                <button type="submit">Registrar</button>
            </form>
            <div id="respuestaDiv"></div>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script type="text/javascript">
                $(document).ready(function() {
                    $("form").submit(function(event) {
                        event.preventDefault();
                        console.log("formulario enviado")
                        var form = $(this);
                        $.ajax({
                            type: form.attr("method"),
                            url: form.attr("action"),
                            data: form.serialize(),
                            success: function(data, ) {
                                $("#respuestaDiv").html(data); // Actualiza el contenido del div
                                if(!data.equals("La password debe coincidir") && !data.equals("Cliente ya existente con ese mail"){
                                    window.location.href ="mostarUsuarios.jsp";
                                }
                            }
                        });
                    });
                });
            </script>
        </div>

    </body>
</html>
