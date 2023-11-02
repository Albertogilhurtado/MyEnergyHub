
package com.mycompany.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Controller;
import modelo.House;
import modelo.User;


@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {
Controller controller = new Controller();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet User</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet User at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<User> clientes = new ArrayList<>();
        clientes = controller.getUsers();
        HttpSession session = request.getSession();
        session.setAttribute("listaUsers", clientes);
        response.sendRedirect("mostrarUsuarios.jsp");
    }


@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<User> lista = controller.getUsers();
        if(lista==null){
            lista= new ArrayList<>();
        }
        String name= request.getParameter("name");
        String surname= request.getParameter("surname");
        String telf= request.getParameter("telf");
        String mail= request.getParameter("mail");
        String pwd= request.getParameter("pwd");
        String pwd2= request.getParameter("pwd2");
        User us = new User(name,surname,telf,mail,pwd);
        Boolean insertar = true;
        String respuesta="";
        
        for(User user : lista){
            if(user.getEmail().equals(us.getEmail())){
                insertar = false;
                request.setAttribute("result", "Cliente ya existente con ese mail");
                respuesta = "Cliente ya existente con ese mail";
            }
        }
        if(!us.getPwd().equals(pwd2)){
                request.setAttribute("result", "La password debe coincidir");
                insertar = false;
                respuesta = "La password debe coincidir";              
            }
    
        if(insertar==true){
            controller.createUser(us );
            controller.createHouse(new House(us.getId()));
            lista.add(new User(name,surname,telf,mail,pwd));
            session.setAttribute("listaUsers", lista);
            response.sendRedirect("login.jsp");
        }if(insertar==false){
            response.setContentType("text/plain");
            response.getWriter().write(respuesta);
        }
    }


@Override
    public String getServletInfo() {
        return "Short description";
    }

}
