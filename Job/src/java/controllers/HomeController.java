/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.LevelDAO;
import dao.LocationDAO;
import dao.PostDAO;
import dao.TypeJobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Level;
import models.Location;
import models.Post;
import models.TypeJob;

/**
 *
 * @author SHD
 */
public class HomeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     private static final int PAGE_SIZE = 3;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String locationIDParam = request.getParameter("location");
        String typeJobIDParam = request.getParameter("typeJob");
        String levelIDParam = request.getParameter("level");
        String pageParam = request.getParameter("page");

        Integer locationID = (locationIDParam != null && !locationIDParam.isEmpty()) ? Integer.parseInt(locationIDParam) : null;
        Integer typeJobID = (typeJobIDParam != null && !typeJobIDParam.isEmpty()) ? Integer.parseInt(typeJobIDParam) : null;
        Integer levelID = (levelIDParam != null && !levelIDParam.isEmpty()) ? Integer.parseInt(levelIDParam) : null;

        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
        int offset = (page - 1) * PAGE_SIZE;

        PostDAO postDAO = new PostDAO();
        List<Post> filteredPosts = postDAO.getFilteredPosts(locationID, typeJobID, levelID, offset, PAGE_SIZE);
        int totalPosts = postDAO.getTotalPostsCount(locationID, typeJobID, levelID);

        int totalPages = (int) Math.ceil((double) totalPosts / PAGE_SIZE);

        LocationDAO locationDAO = new LocationDAO();
        List<Location> locations = locationDAO.getAllLocations();

        TypeJobDAO typeJobDAO = new TypeJobDAO();
        List<TypeJob> typeJobs = typeJobDAO.getAllTypeJobs();

        LevelDAO levelDAO = new LevelDAO();
        List<Level> levels = levelDAO.getAllLevels();

        request.setAttribute("posts", filteredPosts);
        request.setAttribute("locations", locations);
        request.setAttribute("typeJobs", typeJobs);
        request.setAttribute("levels", levels);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
