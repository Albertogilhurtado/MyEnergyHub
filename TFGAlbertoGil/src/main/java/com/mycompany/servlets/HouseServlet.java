
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

@WebServlet(name = "HouseServlet", urlPatterns = {"/HouseServlet"})
public class HouseServlet extends HttpServlet {

    Controller controller = new Controller();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HouseServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HouseServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<House> lista = controller.getHouses();
        User user = (User) session.getAttribute("user");
        if(lista==null){
            lista= new ArrayList<>();
        }
        int habitantes = Integer.parseInt(request.getParameter("ppv"));
        String nombre  = request.getParameter("name");
        int tamaño  = Integer.parseInt(request.getParameter("size"));
        int numeroPaneles = Integer.parseInt(request.getParameter("panels"));
        int id_user = user.getId();
        Double ahorro = 0.0 ;
        Double consumo = Double.valueOf(request.getParameter("cost"));
        Double precioPanel = Double.valueOf(request.getParameter("pricepanel"));
        int numeroCasas=0;
        Double mediaConsumoT = 0.0;
        Double mediaConsumoH = 0.0;
        Double mediaAhorroPaneles = 0.0;
        
        for(House hou : lista){
            numeroCasas++;
            if(hou.getTamaño()>0)
                mediaConsumoT = mediaConsumoT + (hou.getConsumo()/hou.getTamaño());
            if(hou.getHabitantes()>0)
                mediaConsumoH = mediaConsumoH + (hou.getConsumo()/hou.getHabitantes());
            if(hou.getNumeroPaneles()>0)
                mediaAhorroPaneles = mediaAhorroPaneles + (hou.getAhorro()/hou.getNumeroPaneles());
        }
        numeroCasas++;
        mediaConsumoT = mediaConsumoT + (consumo/tamaño);
        mediaConsumoH = mediaConsumoH + (consumo/habitantes);
        
        ahorro= (((mediaConsumoT/numeroCasas)*tamaño) + ((mediaConsumoH/numeroCasas)*habitantes) - (mediaAhorroPaneles*numeroPaneles));

        House house = new House(habitantes,nombre,consumo,ahorro,tamaño,numeroPaneles,precioPanel,id_user);
    
        try {
            controller.updateHouse(house);
        } catch (Exception ex) {
           ex.printStackTrace();
        }
        session.setAttribute("listaUsers", lista);
        response.sendRedirect("calculadoraAhorro.jsp");

    }
    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
