package Servlet;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import javax.sql.DataSource;
import DBUtilities.UserDBUtilities;
import Entities.Utilisateur;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) { // User not connected
			if (request.getParameter("SignUpButton") != null) { // Button To Sign In is clicked
				String username = request.getParameter("username"); // Get username value
				String email = request.getParameter("email"); // Get email value
				String nom = request.getParameter("nom"); // Get nom value
				String prenom = request.getParameter("prenom"); // Get prenom value
				String password = request.getParameter("password"); // Get password value
				String rePassword = request.getParameter("re-password"); // Get re-Password value

				if (username.isBlank() || email.isBlank() || nom.isBlank() || prenom.isBlank() || password.isBlank()
						|| rePassword.isBlank()) {
					request.setAttribute("registerStatus", "Veuillez saisir tous les informations !");
				} else if (!password.equals(rePassword)) {
					request.setAttribute("registerStatus", "Les mots de passe saisis ne sont pas identiques !");
				}else if(userDBUtilities.checkUsernameOrEmailExists(username, email)) {
					request.setAttribute("registerStatus", "Nom d'utilisateur ou Email déjà utilisé !");
				}else {
					String description = "Hi, i'm " + nom + " " + prenom;
					Utilisateur user = new Utilisateur(nom, prenom, username, email, "https://static.wikia.nocookie.net/3f85a5ea-0c09-4faf-b0fc-071f02e8e0cf/scale-to-width/755",password, description);
					try {
						userDBUtilities.userRegister(user);
						request.setAttribute("registerStatus", "Votre compte a été bien créée !");
					} catch (SQLException e) {
						e.printStackTrace();
						request.setAttribute("registerStatus", "Une erreur s'est produite veuillez réessayer...");
					}
				}
			}
			request.getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
		} else { // User is connected
			request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}
	} // End doPost

}
