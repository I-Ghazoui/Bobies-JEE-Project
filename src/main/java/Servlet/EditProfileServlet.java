package Servlet;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import javax.sql.DataSource;

import DBUtilities.UserDBUtilities;
import Entities.Utilisateur;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
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
			request.getServletContext().getRequestDispatcher("/editProfile.jsp").forward(request, response);
		}else {	//User not connected
			request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();	//Get user session
		if(session.getAttribute("user") == null) {	//User not connected
			request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}else {	//User is connected
			//Ajout des cookies
			if(request.getParameter("sauvegarderCookies") != null 
					&& !((String)request.getParameter("favAnimal")).isBlank()) {	//User changes his favorite animal
				if(!((String)request.getParameter("favAnimal")).equals("notChosen")) {
					Cookie cookie = new Cookie("favAnimal", request.getParameter("favAnimal"));
					response.addCookie(cookie);
					request.setAttribute("userAddCookies", "Cookie a été ajouté !");
				}else {
					Cookie cookie = new Cookie("favAnimal", "");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
			//User modifie son profile
			if(request.getParameter("modifierProfil") != null) {
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");
				String description = request.getParameter("description");
				int idUser = ((Utilisateur)session.getAttribute("user")).getId();
				try {
					userDBUtilities.userUpdateInfos(idUser, nom, prenom, description);
					session.setAttribute("user", userDBUtilities.getUserById(idUser));
					request.setAttribute("updateProfilStatus", "Profil mise à jour !");
				} catch (SQLException e) {
					request.setAttribute("updateProfilStatus", "Une erreur est survenue !");
				}
			}
		}
		doGet(request, response);
	}

}
