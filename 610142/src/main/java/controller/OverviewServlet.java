package controller;

import service.TeacherService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/overview.do")
public class OverviewServlet extends HttpServlet {

	private TeacherService overviewService = new TeacherService();

	protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("teachers", overviewService.retrieveTeachers());
		request.getRequestDispatcher("/views/overview.jsp").forward(
				request, response);
	}
}