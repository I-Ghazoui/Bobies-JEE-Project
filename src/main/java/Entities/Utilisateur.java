package Entities;

import java.util.Date;

public class Utilisateur {

	
	//Attributs
	int id;
	String nom;
	String prenom;
	String username;
	String password;
	String description;
	Date dateInscription;
	
	//Constructeurs
	public Utilisateur() {
		
	}

	public Utilisateur(int id, String nom, String prenom, String username, String description,
			Date dateInscription) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.username = username;
		this.description = description;
		this.dateInscription = dateInscription;
	}
	
	public Utilisateur(String nom, String prenom, String username, String password, String description,
			Date dateInscription) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.username = username;
		this.password = password;
		this.description = description;
		this.dateInscription = dateInscription;
	}
	//Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDateInscription() {
		return dateInscription;
	}

	public void setDateInscription(Date dateInscription) {
		this.dateInscription = dateInscription;
	}
}
