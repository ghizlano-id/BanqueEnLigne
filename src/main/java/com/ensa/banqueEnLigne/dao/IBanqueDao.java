package com.ensa.banqueEnLigne.dao;

import com.ensa.banqueEnLigne.entity.Compte;

public interface IBanqueDao {
	public Compte consulterCompte(String codeCpte);
	public void verser(String codeCpte,double montant);
	public void retirer(String codeCpte,double montant);
	public void virement(String codeCpte1,String codeCpte2,double montant);
//	public Page<Operation>	listOperation(String codeCpte,int page,int size);

}
