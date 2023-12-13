
<%@page import="modelo.User"%>
<%@page import="modelo.House"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Controller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
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
            <%
                if(session.getAttribute("login")==null || !session.getAttribute("login").equals("Logged")){
                    response.sendRedirect("login.jsp");
                }else{
                Controller controller = new Controller();
                User user = (User) session.getAttribute("user");
                List <House> houses = controller.getHouses();
                House house = new House(user.getId());
                for(House hou : houses){
                    if(hou.getId_user()==user.getId()){
                        house = hou;
                    }
                }

            %>
                <div style="margin-left: 5%; margin-right: 5%;">
                <h1 style="text-align: center">Calculadora</h1>
                <form action="HouseServlet" method="POST" >
                    <div class="row gtr-uniform">
                        <div class="col-6 col-12-xsmall">
                            <label>Comentario</label>
                        <input type="text" name="name" required value="<%=house.getNombre()%>">
                        </div>
                        <div class="col-6 col-12-xsmall">
                            <label>Personas por vivienda </label>
                        <input type="text" name="ppv" max="20"  pattern="([0-9]{1,2})" required value="<%=house.getHabitantes() %>"></p>
                        </div>
                        <div class="col-6 col-12-xsmall">
                            <label>Tamaño vivienda </label>
                        <input type="text" name="size" pattern="([0-9]{1,5})" required value="<%=house.getTamaño() %>"></p>
                        </div>                    
                        <div class="col-6 col-12-xsmall">
                            <label>Consumo mes en euros</label>
                        <input type="text" name="cost" pattern="([0-9]{1,5}).([0-9]{1,2})" required value="<%=house.getConsumo() %>"></p>
                        </div>
                        <div class="col-6 col-12-xsmall">
                            <label>Numero paneles</label>
                        <input type="text" name="panels" max="50"  pattern="([0-9]{1,2})" required value="<%=house.getNumeroPaneles() %>"></p>
                        </div>
                        <div class="col-6 col-12-xsmall">
                            <label>Precio por panel en euros</label>
                        <input type="text" name="pricepanel"  pattern="([0-9]{1,5}).([0-9]{1,2})" required value="<%=house.getPrecioPanel() %>"></p>
                        </div>
                    </div>  
                    <button class="button primary" type="submit" style="width: 100%; margin-top: 5%">Calcular</button>                               
                </form>

            <h2>Ahorro mensual: <%=house.getAhorro() %> </h2>
            <h2>Meses en amortizar: 
                <% if(house.getNumeroPaneles()!=0 || house.getAhorro()!=0){
                       %>
                       <%=(house.getPrecioPanel()*house.getNumeroPaneles())/house.getAhorro()%>
                       <% 
                    }else{
                       %>
                       <%=0%>
                       <%  
                    }
                %> </h2>
            </div>
            <%}%>
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