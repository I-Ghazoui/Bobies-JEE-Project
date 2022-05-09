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
	String image;

	// Constructeurs
	public Animal(String nom, int age, String image) {
		super();
		this.nom = nom;
		this.age = age;
		this.image = image;
	}
}
