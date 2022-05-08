package Servlet;

import java.io.IOException;

import javax.sql.DataSource;

import DBUtilities.UserDBUtilities;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AjouterAnnonceServlet")
public class AjouterAnnonceServlet extends HttpServlet {
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
		HttpSession session = request.getSession();	//Get user session
		if(session.getAttribute("user") != null) {	//User is connected
			request.getServletContext().getRequestDispatcher("/ajouterAnnonce.jsp").forward(request, response);
		}else {	//User not connected
			request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
