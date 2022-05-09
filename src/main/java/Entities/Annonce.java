package Entities;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Annonce {
	// Attributs
	int id;
	Utilisateur user;
	Animal animal;
	String nom;
	String petiteDescription;
	String description;
	Date dateAnnonce;

	// Constructeurs
	public Annonce(Utilisateur user, Animal animal, String nom, String petiteDescription, String description,
			Date dateAnnonce) {
		super();
		this.user = user;
		this.animal = animal;
		this.nom = nom;
		this.petiteDescription = petiteDescription;
		this.description = description;
		this.dateAnnonce = dateAnnonce;
	}

}
