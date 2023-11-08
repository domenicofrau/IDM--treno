package idm.servlet.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.UtenteBuilder;
import com.idm.trenohibernate.service.UtenteService;

import idm.servlet.bean.UtenteBean;

@Controller
public class ModificaProfilo {

	@Autowired
	UtenteBuilder utenteBuilder;
	@Autowired
	UtenteService utenteService;

	@PostMapping("/modifica-profilo")
	public String modificaProfilo(@ModelAttribute("profile") Utente utente, HttpServletRequest request) {
		
		HttpSession session = request.getSession();	
		Utente u = (Utente) session.getAttribute("loggedInUser");

		u.setNome(utente.getNome());
		u.setCognome(utente.getCognome());
		u.setEmail(utente.getEmail());
		
		utenteService.update(u);

		session.setAttribute("loggedInUser", u);


		return "redirect:/04-profile";
	}

}
