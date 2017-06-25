package com.ensa.banqueEnLigne.entity;

import javax.persistence.Entity;

@Entity
public class CompteCourant extends Compte {

	private double decouvert;

	//Getters and setters
	public double getDecouvert() {
		return decouvert;
	}

	public void setDecouvert(double decouvert) {
		this.decouvert = decouvert;
	}

}
