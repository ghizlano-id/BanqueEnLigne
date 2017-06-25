package com.ensa.banqueEnLigne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ensa.banqueEnLigne.dao.IBanqueDao;
import com.ensa.banqueEnLigne.entity.Compte;

@Controller
public class Testo {
	@Autowired
	IBanqueDao bdao;
	
	public IBanqueDao getBdao() {
		return bdao;
	}

	public void setBdao(IBanqueDao bdao) {
		this.bdao = bdao;
	}
	
	/////////////////////
	
	@RequestMapping(value="/monCompte",method = RequestMethod.GET)
	public ModelAndView afficher(){
		ModelAndView model=new ModelAndView("monCompte");
		
		return model;
	}
	
	

	@RequestMapping(value="/consulerCompte",method = RequestMethod.GET)
	public ModelAndView afficher(@RequestParam("code")String code){
		ModelAndView model=new ModelAndView("monCompte");
		try{
		Compte compte=bdao.consulterCompte(code);
			model.addObject("compte",compte);
		}catch(Exception e){
			model.addObject("exception",e);
		}
		
		return model;
	}

}
