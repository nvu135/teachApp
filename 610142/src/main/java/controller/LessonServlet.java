package controller;

import model.Lesson;
import model.LessonItem;
import model.Lessons;
import model.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Random;


@WebServlet (urlPatterns = "/lessons.do")
public class LessonServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Lessons lessons = (Lessons) session.getAttribute("lessons");
        if (lessons != null) {
            request.setAttribute("lessonItems", lessons.getLessons());
        }
        request.getRequestDispatcher("/views/lessons.jsp").forward(
                request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
