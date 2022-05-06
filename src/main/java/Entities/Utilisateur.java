package Entities;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Utilisateur {
	// Attributs
	int id;
	String nom;
	String prenom;
	String username;
	String email;
	String image;
	String password;
	String description;
	Date dateInscription;

	// Constructeurs
	public Utilisateur() {

	}

	public Utilisateur(int id, String nom, String prenom, String username, String email, String image, String description,
			Date dateInscription) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.username = username;
		this.email = email;
		this.image = image;
		this.description = description;
		this.dateInscription = dateInscription;
	}

	public Utilisateur(String nom, String prenom, String username, String email, String image, String password, String description) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.username = username;
		this.email = email;
		this.image = image;
		this.password = password;
		this.description = description;
	}
}
