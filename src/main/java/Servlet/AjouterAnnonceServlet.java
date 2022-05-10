package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.sql.DataSource;

import DBUtilities.AnimalDBUtilities;
import DBUtilities.AnnonceDBUtilities;
import Entities.Animal;
import Entities.Annonce;
import Entities.Utilisateur;
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
	private AnnonceDBUtilities annonceDBUtilities;
	private AnimalDBUtilities animalDBUtilities;

	@Resource(name = "jdbc/bobies_db")
	private DataSource dataSource;

	public void init() throws ServletException {
		// create our student db util ... and pass in the conn pool / datasource
		try {
			annonceDBUtilities = new AnnonceDBUtilities(dataSource);
			animalDBUtilities = new AnimalDBUtilities(dataSource);
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
		HttpSession session = request.getSession();	//Get user session
		if(session.getAttribute("user") != null) {	//User is connected
			String nomAnimal = request.getParameter("nomAnimal");
			String typeAnimal = request.getParameter("TypeAnimal");
			String ageAnimal = request.getParameter("ageAnimal");
			String imageAnimal = request.getParameter("imageAnimal");
			String titreAnnonce = request.getParameter("titreAnnonce");
			String dateAnnonce = request.getParameter("dateAnnonce");
			String typeAnnonce = request.getParameter("TypeAnnonce");
			String descriptionAnnonce = request.getParameter("descriptionAnnonce");
			
			if(!(nomAnimal.isBlank() || ageAnimal.isBlank() || imageAnimal.isBlank() || typeAnimal.isBlank()
					|| titreAnnonce.isBlank() || dateAnnonce.isBlank() || descriptionAnnonce.isBlank() || typeAnnonce.isBlank())) {
				Animal animal = new Animal(nomAnimal, Integer.parseInt(ageAnimal), typeAnimal, imageAnimal);
				try {
					int idAnimalInserted = animalDBUtilities.userAddAnimal(animal);
					animal.setId(idAnimalInserted);	//Changer id de l'animal a l'id generer lors de l'ajout
					DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					Annonce annonce = new Annonce((Utilisateur)session.getAttribute("user"), animal, titreAnnonce, descriptionAnnonce, descriptionAnnonce, typeAnnonce, formatter.parse(dateAnnonce));
					annonceDBUtilities.userAddAnnonce(annonce);
					request.setAttribute("successAnnonceStatus", "Votre annonce a été bien ajoutée !");
				} catch (SQLException | ParseException e) {
					e.getCause();
					request.setAttribute("failedAnnonceStatus", "Une erreur s'est produite, Veuillez réessayer...");
				}
			}else {
				request.setAttribute("failedAnnonceStatus", "Veuillez saisir tous les informations !");
			}
		}
		doGet(request, response);
	}

}
