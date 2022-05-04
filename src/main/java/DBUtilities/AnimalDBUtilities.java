package DBUtilities;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import Entities.Animal;

public class AnimalDBUtilities {
	private DataSource dataSource;

	public AnimalDBUtilities(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	// Methodes
	public Animal getAnimalById(int id) {
		Animal animal = null;

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
			// get a connection
			myConn = dataSource.getConnection();

			// create sql statement
			String sql = "select * from bobies_animals WHERE id='" + id + "'";

			myStmt = myConn.createStatement();

			// execute query
			myRs = myStmt.executeQuery(sql);

			// process result set
			while (myRs.next()) {
				// retrieve data from result set row
				int id2 = myRs.getInt("id");
				String nom = myRs.getString("nom");
				int age = myRs.getInt("age");
				String description = myRs.getString("description");
				String image = myRs.getString("image");

				// create new student object
				animal = new Animal(id2, nom, age, description, image);
			}
		} catch (Exception e) {

		} finally {
			// close JDBC objects
			CloseConnection.close(myConn, myStmt, myRs);
		}

		return animal;
	}
}
