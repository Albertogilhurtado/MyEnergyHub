
package com.mycompany.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        List<String> errores = new ArrayList<>();
        for(User user : lista){
            if(!((User)session.getAttribute("user")).getEmail().equals(us.getEmail()) && user.getEmail().equals(us.getEmail())){
                insertar = false;
                errores.add( "Cliente ya existente con ese mail");
                session.setAttribute("failedUpdate", errores);
            }
        }
        if(!us.getPwd().equals(pwd2)){
                errores.add( "La password debe coincidir");
                session.setAttribute("failedUpdate", errores);
                insertar = false;
            }
        if(name.length()>30){
            errores.add( "La longitud maxima de nombre es 30");
            session.setAttribute("failedUpdate", errores);
        }if(surname.length()>60){
            errores.add( "La longitud maxima de apellidos es 60");
            session.setAttribute("failedUpdate", errores);
        }if(telf.length()>9){
            errores.add( "La longitud maxima de telefono es 9");
            session.setAttribute("failedUpdate", errores);
        }if(mail.length()>60){
            errores.add( "La longitud maxima del mail es 60");
            session.setAttribute("failedUpdate", errores);
        }if(pwd.length()>30){
            errores.add( "La longitud maxima de la password es 30");
            session.setAttribute("failedUpdate", errores);
        }
        if(insertar==true){
             try {
                 us.setId(((User)session.getAttribute("user")).getId());
                 controller.updateUser(us );
             } catch (Exception ex) {
                 Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
             }
            session.removeAttribute("failedUpdate");
            session.setAttribute("okUpdate", "ok");
            lista.add(new User(name,surname,telf,mail,pwd));
            session.removeAttribute("user");
            session.setAttribute("user", us);
            response.sendRedirect("perfil.jsp");
        }if(insertar==false){
            session.setAttribute("failedUserUpdate",us);
            response.setContentType("text/plain");
            response.sendRedirect("perfil.jsp");
        }
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
        List<String> errores = new ArrayList<>();
        for(User user : lista){
            if(user.getEmail().equals(us.getEmail())){
                insertar = false;
                errores.add( "Cliente ya existente con ese mail");
                session.setAttribute("failedLogIn", errores);
            }
        }
        if(!us.getPwd().equals(pwd2)){
                errores.add( "La password debe coincidir");
                session.setAttribute("failedLogIn", errores);
                insertar = false;
            }
        if(name.length()>30){
            errores.add( "La longitud maxima de nombre es 30");
            session.setAttribute("failedLogIn", errores);
        }if(surname.length()>60){
            errores.add( "La longitud maxima de apellidos es 60");
            session.setAttribute("failedLogIn", errores);
        }if(telf.length()>9){
            errores.add( "La longitud maxima de telefono es 9");
            session.setAttribute("failedLogIn", errores);
        }if(mail.length()>60){
            errores.add( "La longitud maxima del mail es 60");
            session.setAttribute("failedLogIn", errores);
        }if(pwd.length()>30){
            errores.add( "La longitud maxima de la password es 30");
            session.setAttribute("failedLogIn", errores);
        }
        if(insertar==true){
            controller.createUser(us );
            controller.createHouse(new House(us.getId()));
            lista.add(new User(name,surname,telf,mail,pwd));
            response.sendRedirect("login.jsp");
        }if(insertar==false){
            session.setAttribute("failedUser",us);
            response.setContentType("text/plain");
            response.sendRedirect("index.jsp");
        }
    }


@Override
    public String getServletInfo() {
        return "Short description";
    }

}
