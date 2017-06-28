package com.ensa.banqueEnLigne.dao;

import java.util.List;

import com.ensa.banqueEnLigne.entity.Client;
import com.ensa.banqueEnLigne.entity.Compte;
import com.ensa.banqueEnLigne.entity.Operation;

public interface IBanqueDao {
	public Compte consulterCompte(String codeCpte);
	public void verser(String codeCpte,double montant);
	public void retirer(String codeCpte,double montant);
	public void virement(String codeCpte1,String codeCpte2,double montant);
	public List<Operation> getSommeOperations(String codeCpte) ; 
	public List<Operation> getAllOperations(String codeCpte) ;
	public Client estClient(String login,String mdp);

}
