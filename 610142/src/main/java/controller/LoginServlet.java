package controller;

import model.User;
import service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/login.do")
public class LoginServlet extends HttpServlet {

	private LoginService userValidationService = new LoginService();

	protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {


		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if(cookie.getName().equals("rememberMe") && cookie.getName() != null){
				request.getSession().setAttribute("rememberMe", cookie.getValue());

			}
			if(cookie.getName().equals("userName") && cookie.getName() != null){
				request.getSession().setAttribute("userName", cookie.getValue());

			}
		}

		Cookie cookie = new Cookie("promo", "$100");
		cookie.setMaxAge(2592000); //in seconds
		response.addCookie(cookie);

		request.getRequestDispatcher("/views/login.jsp").forward(
				request, response);
	}

	protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		User user = new User(name, password);
		boolean isUserValid = userValidationService.isUserValid(user);



		if (isUserValid) {
			request.getSession().setAttribute("name", name);

			if ((request.getParameter("rememberMe") != null) && (request.getParameter("rememberMe").equals("on")) ){
				Cookie cookieRememberMe = new Cookie("rememberMe", "1");
				cookieRememberMe.setMaxAge(2592000); //in seconds= 30 days
				response.addCookie(cookieRememberMe);
				Cookie cookieName = new Cookie("userName", name);
				cookieName.setMaxAge(2592000); //in seconds= 30 days
				response.addCookie(cookieName);
			} else {
				Cookie cookie = new Cookie("rememberMe", "1");
				cookie.setMaxAge(-1); //remove the cookie
				response.addCookie(cookie);
				Cookie cookieName = new Cookie("userName", "");
				cookieName.setMaxAge(-1); //remove the cookie
				response.addCookie(cookieName);
			}
			response.sendRedirect("/overview.do");


		} else {
			request.setAttribute("errorMessage", "Invalid Credentials!");
			request.getRequestDispatcher("/views/login.jsp").forward(
					request, response);
		}
	}

}