package Servlet;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import javax.sql.DataSource;

import DBUtilities.UserDBUtilities;
import Entities.Utilisateur;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDBUtilities userDBUtilities;

	@Resource(name = "jdbc/bobies_db")
	private DataSource dataSource;

	public void init() throws ServletException {
		// create our student db util ... and pass in the conn pool / datasource
		try {
			userDBUtilities = new UserDBUtilities(dataSource);
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {	//User not connected
			if(request.getParameter("SignInButton")!=null) {	//Button To Sign In is clicked
				String username = request.getParameter("username");	//Get username value
				String password = request.getParameter("password");	//Get password value
				
				Utilisateur user = userDBUtilities.userLogin(username, password);	//Get user with infos
				
				if(user != null) {	//If user exists
					session.setAttribute("user", user);
					request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				}else {	//User not exists
					request.setAttribute("isLogin", false);
					request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
				}
			}
		}else {	//User is connected
			request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}	//End doPost
}
