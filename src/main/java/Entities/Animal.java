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
	String type;
	String image;

	// Constructeurs
	public Animal(String nom, int age, String type, String image) {
		super();
		this.nom = nom;
		this.age = age;
		this.type = type;
		this.image = image;
	}
}
