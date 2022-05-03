package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/searchAnimal")
public class chercherAnimal extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public chercherAnimal() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Les données extraites du formulaire
		String nomAnimal = request.getParameter("nomAnimal");
		String ageAnimal = request.getParameter("ageAnimal");
		String typeAnimal = request.getParameter("typeAnimal");
		
		//Affichage des données
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html>");
		out.println("<head><title>Bobies</title></head>");
		out.println("<body>");
		out.println("Vous chercher, l'animal: " + nomAnimal + ", agé: " + ageAnimal + ", type: " + typeAnimal);
		out.println("</body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
