package servlets;

import models.User;
import services.ChecklistService;
import services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RemovalServlet")
public class RemovalServlet extends HttpServlet {

    UserService userService;
    ChecklistService checklistService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
        checklistService = new ChecklistService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ffffffffff");
        int checklist_id = Integer.parseInt(request.getParameter("checklist_id"));
        int film_id = Integer.parseInt(request.getParameter("film_id"));
//        String film_name = request.getParameter("film_name");
        System.out.println("uuuuuu" + film_id + " " + checklist_id);
        checklistService.removeFilm(checklist_id, film_id);
//        request.getRequestDispatcher("profile").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
