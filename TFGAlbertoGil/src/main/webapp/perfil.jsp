<%-- 
    Document   : perfil
    Created on : 14 nov 2023, 15:57:32
    Author     : Alberto
--%>

<%@page import="modelo.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyEnergyHub</title>
        <script language="JavaScript">
            window.onload = function () {
                document.addEventListener("contextmenu", function (e) {
                    e.preventDefault();
                }, false);
                document.addEventListener("keydown", function (e) {
                    //document.onkeydown = function(e) {
                    // "I" key
                    if (e.ctrlKey && e.shiftKey && e.keyCode == 73) {
                        disabledEvent(e);
                    }
                    // "J" key
                    if (e.ctrlKey && e.shiftKey && e.keyCode == 74) {
                        disabledEvent(e);
                    }
                    // "S" key + macOS
                    if (e.keyCode == 83 && (navigator.platform.match("Mac") ? e.metaKey : e.ctrlKey)) {
                        disabledEvent(e);
                    }
                    // "U" key
                    if (e.ctrlKey && e.keyCode == 85) {
                        disabledEvent(e);
                    }
                    // "F12" key
                    if (event.keyCode == 123) {
                        disabledEvent(e);
                    }
                }, false);
                function disabledEvent(e) {
                    if (e.stopPropagation) {
                        e.stopPropagation();
                    } else if (window.event) {
                        window.event.cancelBubble = true;
                    }
                    e.preventDefault();
                    return false;
                }
            }
    </script>
    </head>
    <body class="is-preload">
       <div id="wrapper">
            <%      User user =(User) session.getAttribute("user");
                if((String)session.getAttribute("login")==null || !((String)session.getAttribute("login")).equals("Logged")){
                    response.sendRedirect("login.jsp");
                }else{
                    if(session.getAttribute("failedUpdate")!=null){
                        List<String> errores = (List<String>)session.getAttribute("failedUpdate");
                        user = (User)session.getAttribute("failedUserUpdate");
                        session.removeAttribute("failedUserUpdate");
                        session.removeAttribute("failedUpdate");
                        if(!errores.isEmpty()){
                        %><div id="respuestaDiv" style="background-color: red;"><%
                            for(int i = 0; i < errores.size(); i++){
                                %> <%=errores.get(i)%><%
                                    %><br><%
                            }
                        %></div><%
                        }
                    }else if (session.getAttribute("okUpdate")!=null){
                             session.removeAttribute("okUpdate");
                           %><div id="respuestaDiv" style="background-color: green;">
                            Perfil actualizado correctamente 
                        </div><% 
                    } 
            %>
            <header id="header">
                <a href="home.jsp" class="logo">MY <strong>ENERGY</strong>  HUB</a>
                <nav>
                        <a href="#menu">Menu</a>
                </nav>
            </header>
            <nav id="menu">
                <ul class="links">
                    <li><a href="home.jsp">Inicio</a></li>
                    <li><a href="calculadoraAhorro.jsp">Calculadora</a></li>
                    <li><a href="perfil.jsp">Mi perfil</a></li>
                    <li><a href="login.jsp" class="button primary fit">Cerrar sesión</a></li>
                </ul>
            </nav>
            <div style="margin-left: 5%; margin-right: 5%;">
                <h1 style="text-align: center">Tu perfil</h1>
                <form action="UserServlet" method="GET" >
                    <div class="row gtr-uniform">
                        <div class="col-6 col-12-xsmall">
                            <label>Nombre</label>
                            <input type="text" name="name" id="demo-name" maxlength="30" required
                                  <% if(user.getName()!=null){ %>
                                    value="<%=user.getName()%>"
                                  <% }else{%> placeholder="Nombre"<%} %>
                                   />
                        </div>
                        <div class="col-6 col-12-xsmall">
                            <label>Apellido</label>
                            <input type="text" name="surname" id="demo-name"  maxlength="60" required
                                  <% if(user.getSurname()!=null){ %>
                                    value="<%=user.getSurname()%>"
                                  <% }else{%> placeholder="Apellido"<%} %>
                                   />
                        </div>
                        <div class="col-12 col-12-xsmall">
                            <label>Email</label>
                            <input type="email" name="mail" id="demo-email"  maxlength="60" required
                                  <% if(user.getEmail()!=null){ %>
                                    value="<%=user.getEmail()%>"
                                  <% }else{%> placeholder="Email"<%} %>
                                   />
                        </div>
                        <div class="col-12 col-12-xsmall">
                            <label>Telefono</label>
                            <input type="tel" name="telf" id="demo-name"  maxlength="9"  pattern="\d{9}" required
                                   <% if(user.getTelf()!=null){ %>
                                   value="<%=user.getTelf()%>"
                                  <% }else{%> placeholder="Telefono"<%} %>
                                   />
                        </div>
                        <div class="col-6 col-12-xsmall">
                            <label>Nueva contraseña</label>
                            <input type="password" name="pwd" id="demo-name"  placeholder="Contraseña" maxlength="30" minlength="8"  required/>
                        </div>
                        <div class="col-6 col-12-xsmall">
                            <label>Repetir nueva contraseña</label>
                            <input type="password" name="pwd2" id="demo-name"  placeholder="Repetir ontraseña" maxlength="30" minlength="8" required/>
                        </div>
                    </div>
                    <button class="button primary" type="submit" style="width: 100%; margin-top: 5%">Actualizar</button>

                </form>
                                  <% }%>
            <button style="width: 100%; margin-top: 1%" onclick="location.href='borrarCuenta.jsp'">Borrar mi cuenta</button>
            </div>
       </div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
    </body>
</html>
