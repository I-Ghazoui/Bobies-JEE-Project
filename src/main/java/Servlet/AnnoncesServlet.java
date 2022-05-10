package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.sql.DataSource;

import DBUtilities.AnnonceDBUtilities;
import DBUtilities.UserDBUtilities;
import Entities.Annonce;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Annonces")
public class AnnoncesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AnnonceDBUtilities annonceDBUtilities;

	@Resource(name = "jdbc/bobies_db")
	private DataSource dataSource;

	public void init() throws ServletException {
		// create our student db util ... and pass in the conn pool / datasource
		try {
			annonceDBUtilities = new AnnonceDBUtilities(dataSource);
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {	//User is connected
			ArrayList<Annonce> listDesAnnonces = annonceDBUtilities.getAllAnnonces();
			request.setAttribute("listDesAnnonces", listDesAnnonces);
			request.getServletContext().getRequestDispatcher("/Annonce.jsp").forward(request, response);
		}else {	//User not connected
			request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {	//User is connected
			String typeAnimal = request.getParameter("TypeAnimal");
			request.setAttribute("typeAnimal", typeAnimal);	//add select animal type
			String typeAnnonce = request.getParameter("TypeAnnonce");
			request.setAttribute("typeAnnonce", typeAnnonce);	//add select annonce type
			//Get filtered annonces
			ArrayList<Annonce> listDesAnnonces = annonceDBUtilities.getFilteredAllAnnonces(typeAnimal, typeAnnonce);
			request.setAttribute("listDesAnnonces", listDesAnnonces);
			request.getServletContext().getRequestDispatcher("/Annonce.jsp").forward(request, response);
		}else {	//User not connected
			request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

}
