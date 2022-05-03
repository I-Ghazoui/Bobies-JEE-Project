package DBUtilities;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import javax.sql.DataSource;

import Entities.Utilisateur;

public class UserDBUtilities {
	
	private DataSource dataSource;

	public UserDBUtilities(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	//Methodes
		public Utilisateur userLogin(String username, String password) {
			Utilisateur user = null;
			
			Connection myConn = null;
			Statement myStmt = null;
			ResultSet myRs = null;

			try {
				// get a connection
				myConn = dataSource.getConnection();
				
				// create sql statement
				String sql = "select * from bobies_users WHERE username='"+username+"' AND password='"+password+"'";
				
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
					String description = myRs.getString("description");
					Date dateInscription = myRs.getDate("dateInscription");
									
					// create new student object
					user = new Utilisateur(id, nom, prenom, username2, description, dateInscription);
				}
			}catch(Exception e) {
				
			}finally {
				// close JDBC objects
				close(myConn, myStmt, myRs);
			}
			
			return user;
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
				myConn.close();   // doesn't really close it ... just puts back in connection pool
			}
		}catch (Exception exc) {
			exc.printStackTrace();
		}
	}
}
