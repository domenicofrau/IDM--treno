package idm.servlet.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.UtenteBuilder;
import com.idm.trenohibernate.exceptions.UtenteException;
import com.idm.trenohibernate.service.UtenteService;

import idm.servlet.bean.UtenteBean;

@Controller
public class UtenteController {

	@Autowired
	UtenteBuilder utenteBuilder;
	@Autowired
	UtenteService utenteService;
	
	@PostMapping("doRegister")
	public String addUtente(@ModelAttribute("utente") UtenteBean utente, Model model, HttpSession session) {
		String nomeUtente = utente.getNome();
		String cognomeUtente = utente.getCognome();
		String emailUtente = utente.getEmail();
		String passwordUtente = utente.getPassword();
		String immagine = utente.getProfilePic();
		String nazione = utente.getNazione();
		try {
			Utente u = utenteBuilder.creaUtente(nomeUtente, cognomeUtente, emailUtente, passwordUtente,
					immagine.replace(",", ""),nazione);
			utenteService.crea(u);
			session.setAttribute("loggedInUser", u);
		} catch (UtenteException e) {
			e.printStackTrace();
		}
		return "redirect:/09-benvenuto";
	}

	@PostMapping("/doLogin")
	public String login(@ModelAttribute("utente") Utente utente, Model model, HttpSession session) {
		try {
			if (utenteService.login(utente.getEmail(), utente.getPassword())) {
				Utente u = utenteService.findByEmail(utente.getEmail());
				System.out.println("benvenuto");
				session.setAttribute("loggedInUser", u);
				return "redirect:/03-home";
			}
		} catch (UtenteException e) {
			e.printStackTrace();
		}
		System.out.println("qualcosa è andato storto");
		return "pagina-errore-login";
	}
	
	@GetMapping("doLogout")
	public String logout(HttpSession session){
		
		session.invalidate();
		System.out.println("Logout effettuato correttamente");
		return "redirect:/01-welcome";
	}

}

