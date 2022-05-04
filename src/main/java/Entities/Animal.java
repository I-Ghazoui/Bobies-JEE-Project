package Entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Animal {
	// Attributs
	int id;
	String nom;
	int age;
	String description;
	String image;

	// Constructeurs
	public Animal(String nom, int age, String description, String image) {
		super();
		this.nom = nom;
		this.age = age;
		this.description = description;
		this.image = image;
	}
}
