
package com.mycompany.servlets;

import controllers.EncriptadorController;
import controllers.exceptions.NonexistentEntityException;
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

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    Controller controller = new Controller();
    EncriptadorController encriptador = new EncriptadorController();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        House casa = (House)session.getAttribute("userHouse");
        try {
            controller.deleteUser(user.getId());
            controller.deleteHouse(casa.getId());
            response.sendRedirect("login.jsp");
        } catch (NonexistentEntityException ex) {
            response.sendRedirect("perfil.jsp");
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        String mail= request.getParameter("mail");
        String pwd= request.getParameter("pwd");
        Boolean login = false;
        
        for(User user : lista){
            if(user.getEmail().equals(mail) && pwd.equals(encriptador.decrypt(user.getPwd(), "secrete"))){
                List<House> casas = controller.getHouses();
                login = true;
                session.setAttribute("login", "Logged");
                user.setPwd(encriptador.encrypt(user.getPwd(),"secrete"));
                session.setAttribute("user", user);
                for(House ho : casas){
                    if(ho.getId_user()==user.getId()){
                        session.setAttribute("userHouse", ho);
                    }
                }
            }
        }
        if(login==false){
            List<String> errores = new ArrayList<>();
            errores.add( "Email/Contraseña incorrectos");
            session.setAttribute("failedLogIn", errores);
            session.setAttribute("login", "No");
            session.setAttribute("mail",mail);
            session.setAttribute("pwd",pwd);
            response.sendRedirect("login.jsp");
        }else{
            response.sendRedirect("home.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
