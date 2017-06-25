package com.ensa.banqueEnLigne.dao;

import java.util.Date;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ensa.banqueEnLigne.entity.Compte;
import com.ensa.banqueEnLigne.entity.CompteCourant;
import com.ensa.banqueEnLigne.entity.Retrait;
import com.ensa.banqueEnLigne.entity.Versement;

@Repository

public class BanqueDaoImpl implements IBanqueDao{

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	//////////////////////////////////////
	@Transactional
	public Compte consulterCompte(String codeCpte) {
		
		//System.out.println(getSessionFactory());
		Compte compte= (Compte) getSessionFactory().getCurrentSession().get(Compte.class,codeCpte);
		
		if(compte==null)
			throw new RuntimeException("Compte introuvable");
		
		return compte;
	}
	@Transactional
	public void verser(String codeCpte, double montant) {
		Compte compte=consulterCompte(codeCpte);
		Versement v=new Versement();
		v.setCompte(compte);
		v.setDateOperation(new Date());
		v.setMontant(montant);
		//Enregistrer le virement
		getSessionFactory().getCurrentSession().save(v);
		//Actualiser le montant de
		compte.setSolde(compte.getSolde()+montant);
		getSessionFactory().getCurrentSession().update(compte);

	}
	@Transactional
	public void retirer(String codeCpte, double montant) {
		Compte compte=consulterCompte(codeCpte);
		double decouvt=0;
		if(compte instanceof CompteCourant) // 
			decouvt=((CompteCourant) compte).getDecouvert();
		if(compte.getSolde()+decouvt<montant)
			throw new RuntimeException("Solde Insuffisant");
		Retrait r=new Retrait();
		r.setCompte(compte);
		r.setDateOperation(new Date());
		r.setMontant(montant);
		//Enregistrer le retrait
		getSessionFactory().getCurrentSession().save(r);
		//Actualiser le montant de
		compte.setSolde(compte.getSolde()-montant);
		getSessionFactory().getCurrentSession().update(compte);

	}
	@Transactional
	public void virement(String codeCpte1, String codeCpte2, double montant) {
		retirer(codeCpte1,montant);
		verser(codeCpte2,montant);

	}

}
