
<%@page import="modelo.Controller"%>
<%@page import="java.util.List"%>
<%@page import="modelo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar usuarios</title>
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
        <h1>Lista</h1>
        <%
            Controller controller = new Controller();
            List<User> lista = controller.getUsers();
            int cont=0;
            if(lista!=null){
                for(User usu : lista){                
        %>   
                    <p><b>Usuario Nº <%=cont%></b></p>
                    <p>Name: <%=usu.getName()%></p>
                    <p>Surname: <%=usu.getSurname()%></p>
                    <p>Telefono: <%=usu.getTelf()%></p>
                    <p>Email: <%=usu.getEmail()%></p>
                    <p>Pwd:  <%=usu.getPwd()%></p>  
                    <p>-----------------------------</p>
        <%   
                cont++;
                }
            }
        %>
    </body>
</html>
