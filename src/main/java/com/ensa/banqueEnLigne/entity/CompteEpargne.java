package com.ensa.banqueEnLigne.entity;

import javax.persistence.Entity;

@Entity
public class CompteEpargne extends Compte{
		private double taux;

		public double getTaux() {
			return taux;
		}

		public void setTaux(double taux) {
			this.taux = taux;
		}

}
