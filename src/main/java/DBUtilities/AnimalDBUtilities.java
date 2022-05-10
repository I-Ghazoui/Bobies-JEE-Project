package DBUtilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
				String type = myRs.getString("type");
				String image = myRs.getString("image");

				// create new student object
				animal = new Animal(id2, nom, age, type, image);
			}
		} catch (Exception e) {

		} finally {
			// close JDBC objects
			CloseConnection.close(myConn, myStmt, myRs);
		}

		return animal;
	}

	public Animal getAnimalByIdAndType(int id, String typeAnimal) {
		Animal animal = null;

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
			// get a connection
			myConn = dataSource.getConnection();

			// create sql statement
			String sql = "select * from bobies_animals WHERE id='" + id + "'";
			//Add animal filter type
			if(typeAnimal != null && !typeAnimal.isBlank()) {
				sql += " AND type='"+typeAnimal+"'";
			}

			myStmt = myConn.createStatement();

			// execute query
			myRs = myStmt.executeQuery(sql);

			// process result set
			while (myRs.next()) {
				// retrieve data from result set row
				int id2 = myRs.getInt("id");
				String nom = myRs.getString("nom");
				int age = myRs.getInt("age");
				String type = myRs.getString("type");
				String image = myRs.getString("image");

				// create new student object
				animal = new Animal(id2, nom, age, type, image);
			}
		} catch (Exception e) {

		} finally {
			// close JDBC objects
			CloseConnection.close(myConn, myStmt, myRs);
		}

		return animal;
	}
	
	public int userAddAnimal(Animal animal) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		int animalInsertedId = 0;

		try {
			// get db connection
			myConn = dataSource.getConnection();

			// create sql for insert
			String sql = "insert into bobies_animals "
					+ "(nom, age, type, image) "
					+ "values (?, ?, ?, ?)";

			myStmt = myConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			// set the param values for the student
			myStmt.setString(1, animal.getNom());
			myStmt.setInt(2, animal.getAge());
			myStmt.setString(3, animal.getType());
			myStmt.setString(4, animal.getImage());

			// execute sql insert
			myStmt.execute();
			
			//get latest id inserted
			ResultSet rs = myStmt.getGeneratedKeys();
			if(rs.next()){
                animalInsertedId = rs.getInt(1);
            }
		} finally {
			// clean up JDBC objects
			CloseConnection.close(myConn, myStmt, null);
		}
		return animalInsertedId;
	}
}
