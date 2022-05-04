package DBUtilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import javax.sql.DataSource;

import Entities.Utilisateur;

public class UserDBUtilities {

	private DataSource dataSource;

	public UserDBUtilities(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	// Methodes
	public Utilisateur userLogin(String username, String password) {
		Utilisateur user = null;

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
			// get a connection
			myConn = dataSource.getConnection();

			// create sql statement
			String sql = "select * from bobies_users WHERE username='" + username + "' AND password='" + password + "'";

			myStmt = myConn.createStatement();

			// execute query
			myRs = myStmt.executeQuery(sql);

			// process result set
			while (myRs.next()) {
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String nom = myRs.getString("nom");
				String prenom = myRs.getString("prenom");
				String username2 = myRs.getString("username");
				String email = myRs.getString("email");
				String description = myRs.getString("description");
				Date dateInscription = myRs.getDate("dateInscription");

				// create new student object
				user = new Utilisateur(id, nom, prenom, username2, email, description, dateInscription);
			}
		} catch (Exception e) {

		} finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}

		return user;
	}

	public void userRegister(Utilisateur user) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();

			// create sql for insert
			String sql = "insert into bobies_users "
					+ "(username, nom, prenom, password, email, dateInscription, description) "
					+ "values (?, ?, ?, ?, ?, NOW(), ?)";

			myStmt = myConn.prepareStatement(sql);

			// set the param values for the student
			myStmt.setString(1, user.getUsername());
			myStmt.setString(2, user.getNom());
			myStmt.setString(3, user.getPrenom());
			myStmt.setString(4, user.getPassword());
			myStmt.setString(5, user.getEmail());
			myStmt.setString(6, user.getDescription());

			// execute sql insert
			myStmt.execute();
		} finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}

	public boolean checkUsernameOrEmailExists(String username, String email) {
		boolean checkEmailOrUsernameExists = false;
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
			myConn = dataSource.getConnection();
			String sql = "select * from bobies_users WHERE username='" + username + "' OR email='" + email + "'";
			myStmt = myConn.createStatement();
			myRs = myStmt.executeQuery(sql);

			while (myRs.next()) {
				checkEmailOrUsernameExists = true;
				break;
			}
		} catch (Exception e) {
		} finally {
			close(myConn, myStmt, myRs);
		}
		return checkEmailOrUsernameExists;
	}

	private static void close(Connection myConn, Statement myStmt, ResultSet myRs) {
		try {
			if (myRs != null) {
				myRs.close();
			}

			if (myStmt != null) {
				myStmt.close();
			}

			if (myConn != null) {
				myConn.close(); // doesn't really close it ... just puts back in connection pool
			}
		} catch (Exception exc) {
			exc.printStackTrace();
		}
	}
}
