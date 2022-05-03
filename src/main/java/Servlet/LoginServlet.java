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
	
	@Resource(name="jdbc/bobies_db")
	private DataSource dataSource;
       
    public void init() throws ServletException {
        // create our student db util ... and pass in the conn pool / datasource
     	try {
     		userDBUtilities = new UserDBUtilities(dataSource);
     	}catch (Exception exc) {
     		throw new ServletException(exc);
     	}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("SignInButton")!=null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			Utilisateur user = userDBUtilities.userLogin(username, password);
			
			if(user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			}else {
				request.setAttribute("isLogin", false);
				request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}
	}
}
