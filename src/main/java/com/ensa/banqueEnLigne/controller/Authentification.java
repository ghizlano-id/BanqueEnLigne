package com.ensa.banqueEnLigne.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ensa.banqueEnLigne.dao.IBanqueDao;
import com.ensa.banqueEnLigne.entity.Client;

@Controller
public class Authentification {
	@Autowired
	IBanqueDao bdao;
	
	public IBanqueDao getBdao() {
		return bdao;
	}

	public void setBdao(IBanqueDao bdao) {
		this.bdao = bdao;
	}
	
	
	
	
	
	@RequestMapping(value="/login")
	public ModelAndView afficher(){
		ModelAndView model=new ModelAndView("authentification");

		return model;
	}

	@RequestMapping(value="/compte",method = RequestMethod.POST)
	public ModelAndView compte(String login,String mdp,HttpServletRequest req){
		
		try{
			Client client=bdao.estClient(login, mdp);
			HttpSession session=req.getSession();
			  session.setAttribute("codeClient", client.getCode());
			return new ModelAndView("redirect:/monCompte");
		}catch(Exception e){
			ModelAndView model=new ModelAndView("authentification");
			model.addObject("exception",e);
			return model;
			
		}
		

	}
}
