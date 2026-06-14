package com.uitmportfolio;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PortfolioServlet")
public class PortfolioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String studyMode = request.getParameter("studyMode");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        request.setAttribute("name", name);
        request.setAttribute("studentId", studentId);
        request.setAttribute("program", program);
        request.setAttribute("email", email);
        request.setAttribute("studyMode", studyMode);
        request.setAttribute("hobbies", hobbies);
        request.setAttribute("intro", intro);

        request.getRequestDispatcher("portfolio.jsp").forward(request, response);
    }
}
