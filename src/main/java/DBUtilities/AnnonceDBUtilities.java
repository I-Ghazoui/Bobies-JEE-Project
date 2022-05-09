package DBUtilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

	public void userAddAnnonce(Annonce annonce) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();

			// create sql for insert
			String sql = "insert into bobies_annonces "
					+ "(idUser, idAnimal, nom, petiteDescription, description, dateAnnonce) "
					+ "values (?, ?, ?, ?, ?, ?)";

			myStmt = myConn.prepareStatement(sql);

			// set the param values for the student
			myStmt.setInt(1, annonce.getUser().getId());
			myStmt.setInt(2, annonce.getAnimal().getId());
			myStmt.setString(3, annonce.getNom());
			if(annonce.getPetiteDescription().length()>47) {
				annonce.setPetiteDescription((annonce.getPetiteDescription().substring(0, 47)+"..."));
			}
			myStmt.setString(4, annonce.getPetiteDescription());
			if(annonce.getDescription().length()>250) {
				annonce.setDescription((annonce.getDescription().substring(0, 250)));
			}
			myStmt.setString(5, annonce.getDescription());
			long timeInMilliSeconds = annonce.getDateAnnonce().getTime();
			myStmt.setDate(6, new java.sql.Date(timeInMilliSeconds));

			// execute sql insert
			myStmt.execute();
		}catch(Exception e){
			System.out.println(e);
		}finally {
			// clean up JDBC objects
			CloseConnection.close(myConn, myStmt, null);
		}
	}
}
