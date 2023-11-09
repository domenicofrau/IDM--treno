package idm.servlet.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.UtenteBuilder;
import com.idm.trenohibernate.service.UtenteService;

@Controller
public class ModificaImmagine {

	@Autowired
	UtenteBuilder utenteBuilder;
	@Autowired
	UtenteService utenteService;

	@PostMapping("/salva-immagine-profilo")
	public String salvaImmagineProfilo(@RequestParam("profilePic") String urlImmagine, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		Utente u = (Utente) session.getAttribute("loggedInUser");

		utenteService.updateProfileImage(u.getId(), urlImmagine);

		u.setImmagineProfilo(urlImmagine);
		session.setAttribute("loggedInUser", u);

		redirectAttributes.addFlashAttribute("message", "Immagine profilo aggiornata con successo!");

		return "redirect:/04-profile";
	}

}
