package idm.servlet.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.idm.trenohibernate.exceptions.UtenteException;
import com.idm.trenohibernate.service.UtenteService;

import idm.servlet.bean.UtenteBean;

@Controller
public class UtenteController {
	
	@Autowired
	UtenteService utenteService;
	
	@GetMapping("/10-log-in")
	public String login(@ModelAttribute("utente") UtenteBean utente, Model model) {

		try {
			utenteService.login(utente.getEmail(), utente.getPassword());
		} catch (UtenteException e) {
			e.printStackTrace();
		}
		return "10-login";
	}

}
