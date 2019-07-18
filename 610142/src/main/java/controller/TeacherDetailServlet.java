package controller;

import model.*;
import service.TeacherService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

@WebServlet(urlPatterns = "/detail.do")
public class TeacherDetailServlet extends HttpServlet {
    private static final Random r = new Random(); // <- shared resource

    private TeacherService teacherService = new TeacherService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doGet(req, resp);
        String teacherId = request.getParameter("teacherId");
        Teacher teacher = teacherService.getTeacher(teacherId);
        request.setAttribute("teacher", teacher);
        request.getRequestDispatcher("/views/teacherDetail.jsp").forward(
                request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        Lessons lessons;
        HttpSession session = request.getSession();
        lessons = (Lessons) session.getAttribute("lessons");
        if (lessons == null) {
            lessons = new Lessons();
            session.setAttribute("lessons", lessons);
        }
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        Period period = new Period(start, end);
        String teacherId = request.getParameter("teacherId");
        String lessonID = String.valueOf(r.nextLong());
        Lesson lesson = new Lesson("1", "English", "If you just started learning English, you first need to know some basic rules of the language. Developing a solid foundation in English grammar will not only help you create your own sentences correctly but will also make it easier to improve your communication skills in both spoken and written English. \n", "20");
        LessonItem lessonItem = new LessonItem(lessonID, lesson, period, teacherId);


        lessons.addLessonItem(lessonItem);
        session.setAttribute("lessons", lessons);
    }
}
