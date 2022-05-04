package DBUtilities;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import javax.sql.DataSource;

import Entities.Animal;
import Entities.Annonce;
import Entities.Utilisateur;

public class AnnonceDBUtilities {
	private DataSource dataSource;

	public AnnonceDBUtilities(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	// Methodes
	public ArrayList<Annonce> getAllAnnonces() {
		ArrayList<Annonce> listDesAnnonces = new ArrayList<Annonce>();

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
			// get a connection
			myConn = dataSource.getConnection();

			// create sql statement
			String sql = "select * from bobies_annonces";

			myStmt = myConn.createStatement();

			// execute query
			myRs = myStmt.executeQuery(sql);

			// process result set
			while (myRs.next()) {
				// retrieve data from result set row
				int id = myRs.getInt("id");
				//Get User
				UserDBUtilities userDBUtilities = new UserDBUtilities(dataSource);
				Utilisateur user = userDBUtilities.getUserById(myRs.getInt("idUser"));
				//Get Animal
				AnimalDBUtilities animalDBUtilities = new AnimalDBUtilities(dataSource);
				Animal animal = animalDBUtilities.getAnimalById(myRs.getInt("idAnimal"));
				//Other Infos
				String nom = myRs.getString("nom");
				String petiteDescription = myRs.getString("petiteDescription");
				String description = myRs.getString("description");
				Date dateAnnonce = myRs.getDate("dateAnnonce");

				// create new student object
				Annonce annonce = new Annonce(id, user, animal, nom, petiteDescription, description, dateAnnonce);
				listDesAnnonces.add(annonce);
			}
		} catch (Exception e) {

		} finally {
			// close JDBC objects
			CloseConnection.close(myConn, myStmt, myRs);
		}

		return listDesAnnonces;
	}

}
