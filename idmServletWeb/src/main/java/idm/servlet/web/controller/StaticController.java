package idm.servlet.web.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.service.TrenoService;
import com.idm.trenohibernate.service.UtenteService;

import idm.servlet.bean.UtenteBean;

@Controller
public class StaticController {
	
	@Autowired
	TrenoService trenoService;
	
	@Autowired
	UtenteService utenteService;
	
	@GetMapping("/01-welcome")
	public String welcome(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UtenteBean loggedInUser = (UtenteBean) session.getAttribute("loggedInUser");
		 if (loggedInUser != null) {
	            model.addAttribute("loggedInUser", loggedInUser);
	        } else {
	            model.addAttribute("errorMessage", "User not logged in");
	        }
		return "01-welcome";
	}

	@GetMapping("/02-login")
	public String login(Model model) {
		return "02-login";
	}
	
	@GetMapping("/03-home")
	public String home(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UtenteBean loggedInUser = (UtenteBean) session.getAttribute("loggedInUser");
		Utente utente = utenteService.findByEmail(loggedInUser.getEmail());
		model.addAttribute("utente", utente);
		List<Treno> treni = trenoService.findAll();
		
		if (treni.size() != 0) {
			model.addAttribute("treni", treni);
		} else {
			model.addAttribute("errore", "Al momento non ci sono treni da vedere... creane uno tu!");
		}
		return "03-home";
	}
	
	@GetMapping("/04-profile")
	public String profile(Model model) {
		Utente utente = utenteService.find(2096);
		model.addAttribute("utente", utente);
		List<Treno> treni = trenoService.findByUtenteId(2096);

		Collections.reverse(treni);

		model.addAttribute("treni", treni);

		return "04-profile";
	}

	@GetMapping("/05-train-detail")
	public String trainDetail(Model model) {
		return "05-train-detail";
	}

	@GetMapping("/06-crea-treno")
	public String selezionaFactory(String factory, Model model) {
		model.addAttribute("selectedFactory", factory);
		return "06-crea-treno";
	}

}

