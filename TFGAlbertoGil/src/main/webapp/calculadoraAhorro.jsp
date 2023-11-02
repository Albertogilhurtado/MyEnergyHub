
<%@page import="modelo.User"%>
<%@page import="modelo.House"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Controller"%>
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
                    <li><a href="#">Logout</a></li>
                    <li><a href="mostrarUsuarios.jsp">Lista Usuarios</a></li>
                    <li><a href="calculadoraAhorro.jsp">Mi casa</a></l>
                    <li><a href="#">Mi cuenta</a></li>
                    <li><a href="#">Contacto</a></li>
                 </ul>
            </nav>
        </header>
        <%
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
        <h1>Calculadora</h1>
            <form action="HouseServlet" method="POST" >
                <p><label>Nombre</label>
                    <input type="text" name="name" required value="<%=house.getNombre()%>"></p>
                <p><label>Personas por vivienda </label>
                    <input type="number" name="ppv" max="20"  pattern="([0-9]{1,2})" required value="<%=house.getHabitantes() %>"></p>
                <p><label>Tamaño vivienda</label>
                    <input type="number" name="size" pattern="([0-9]{1,5})" required value="<%=house.getTamaño() %>"></p>
                <p><label>Consumo mes</label>
                    <input type="number" name="cost" pattern="([0-9]{1,5}).([0-9]{1,2})" required value="<%=house.getConsumo() %>"></p>
                <p><label>Numero paneles</label>
                    <input type="number" name="panels" max="50"  pattern="([0-9]{1,2})" required value="<%=house.getNumeroPaneles() %>"></p>
                <p><label>Precio por panel</label>
                    <input type="number" name="pricepanel"  pattern="([0-9]{1,5}).([0-9]{1,2})" required value="<%=house.getPrecioPanel() %>"></p>
                <button type="submit">Enviar</button>
            </form>
        <h2>Ahorro mensual: <%=house.getAhorro() %> </h2>
        <h2>Meses en amortizar: <%=(house.getPrecioPanel()*house.getNumeroPaneles())/house.getAhorro() %> </h2>

    </body>
</html>