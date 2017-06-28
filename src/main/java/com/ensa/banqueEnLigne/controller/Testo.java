package com.ensa.banqueEnLigne.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ensa.banqueEnLigne.dao.IBanqueDao;
import com.ensa.banqueEnLigne.entity.Compte;
import com.ensa.banqueEnLigne.entity.Operation;

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
	
	/*	@RequestMapping(value="/test")
	public ModelAndView afficher2(){
		ModelAndView model=new ModelAndView("test");
		 List<Operation> l = bdao.getAll("CC1") ;
		 for(Operation o : l )
			 
		 System.out.println(o.getNumero());
		return model;
	}*/
	
	
	

	@RequestMapping(value="/consulerCompte",method = RequestMethod.GET)
	public ModelAndView afficher(@RequestParam("code")String code,HttpServletRequest req){
		ModelAndView model=new ModelAndView("monCompte");
		HttpSession session=req.getSession(true);
		try{
		Compte compte=bdao.consulterCompte(code);
		 if(compte.getClient().getCode()!=((Long)session.getAttribute("codeClient")))
			 model.addObject("exception","code compte invalid");
		 else{
			model.addObject("compte",compte);
			 List<Operation> operations = bdao.getSommeOperations(code) ;
			 model.addObject("operations",operations) ;
			 session.setAttribute("codeCpte", code);
		 }
			 
		}catch(Exception e){
			
			model.addObject("exception",e);
		}
		
		return model;
	}
	
	//////////////////////
	
	
	@RequestMapping(value="/operation",method = RequestMethod.GET)
	public ModelAndView afficher2(@RequestParam("typeOperation")String typeOperation,@RequestParam("codeCompte") String codeCompte , @RequestParam("montant")double montant  , @RequestParam("codeCompte2")String codeCompte2)
		
		{
		
		ModelAndView model = new ModelAndView() ;
		
		System.out.println(typeOperation+" "+codeCompte+" "+montant+" "+codeCompte2);
		
		try{
		 
			if(typeOperation.equals("VERS"))
				bdao.verser(codeCompte, montant);
			
			else if(typeOperation.equals("RET"))
				bdao.retirer(codeCompte, montant);
			
			if(typeOperation.equals("VIR"))
				bdao.virement(codeCompte,codeCompte2, montant);
			
		}catch(Exception e){
			
			model.addObject("exception",e); 
			
		}
		 model.setViewName("redirect:/consulerCompte?code="+codeCompte);
		return model;
	}
	@RequestMapping(value="/tableOperations")
	public ModelAndView AllOperations(HttpServletRequest rq){
		ModelAndView model=new ModelAndView("test");
		HttpSession session=rq.getSession(true);
		String codeCpte=(String) session.getAttribute("codeCpte"); //!!!!
		
		 List<Operation> operations=bdao.getAllOperations(codeCpte);
		 
		 model.addObject("allOperations", operations);
		 
		
		return model;
	}
	@RequestMapping(value="/goCompte")
	public ModelAndView monCompte(HttpServletRequest rq){
		ModelAndView model=new ModelAndView();
		HttpSession session=rq.getSession(true);
		String codeCpte=(String) session.getAttribute("codeCpte");
		
		 model.setViewName("redirect:/consulerCompte?code="+codeCpte);
			return model;
	}
	
	
	
	

}
