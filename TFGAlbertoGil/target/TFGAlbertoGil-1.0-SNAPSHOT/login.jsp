
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
                    <li><a href="index.jsp">Register</a></li>
                 </ul>
            </nav>
        </header>
        <h1>Inicia sesion</h1>
            <form action="LoginServlet" method="POST" >
                <p><label>Email</label><input type="email" name="mail" required></p>
                <p><label>Contraseña</label><input type="password" name="pwd" required></p>
                <button type="submit">Login</button>
            </form>
    </body>
</html>
