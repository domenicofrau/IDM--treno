package idm.servlet.web.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.service.TrenoService;
import com.idm.trenohibernate.service.UtenteService;

@Controller
public class EliminaController {
	
	@Autowired
	TrenoService trenoService;
	
	@Autowired
	UtenteService utenteService;
	

	@PostMapping("/eliminaTreno")
	public String eliminaTreno(@RequestParam("id") int id,HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Utente u= (Utente) session.getAttribute("loggedInUser");
		model.addAttribute("id", id);
		Treno treno = trenoService.find(id);
		int prezzoTotale = treno.getPrezzoTotale();

		trenoService.delete(id);
		
		int bitTrain = u.getbitTrain();
		u.setbitTrain(bitTrain + prezzoTotale);
		utenteService.update(u);

		model.addAttribute("utente", u);
		List<Treno> treni = trenoService.findByUtenteId(u.getId());

		Collections.reverse(treni);

		model.addAttribute("treni", treni);

		return "redirect:/04-profile";
	}
	

}
