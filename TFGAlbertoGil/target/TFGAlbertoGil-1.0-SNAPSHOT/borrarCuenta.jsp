
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@page import="modelo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <% 
            if(session.getAttribute("login")==null || !session.getAttribute("login").equals("Logged")){
                    response.sendRedirect("login.jsp");
            }
        %>
       <div id="wrapper">        
        <header id="header" style="margin-bottom: 5%; padding-bottom: 2%;">
            <a href="home.jsp" class="logo">MY <strong>ENERGY</strong>  HUB</a>
	</header>
            <div style="margin-left: 5%; margin-right: 5%; margin-top: 2%">
            <h1 style="text-align: center">¿Esta seguro de borrar su cuenta?</h1>
            <form action="LoginServlet" method="GET" >
                <button class="button primary" type="submit" style="width: 100%; margin-top: 5%">Borrar mi cuenta</button>                               
            </form>
            <button style="width: 100%; margin-top: 1%" onclick="location.href='perfil.jsp'">No, quiero mantener mi cuenta</button>
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
