package com.ensa.banqueEnLigne.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity 
public class Client {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long code;
	private String nom;
	private String email;
	@OneToMany(mappedBy="client")  //Dans la clasee Compte
	private Collection<Compte> comptes;
	
	// Getters and setters
	public long getCode() {
		return code;
	}
	public void setCode(long code) {
		this.code = code;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Collection<Compte> getComptes() {
		return comptes;
	}
	public void setComptes(Collection<Compte> comptes) {
		this.comptes = comptes;
	}
}
