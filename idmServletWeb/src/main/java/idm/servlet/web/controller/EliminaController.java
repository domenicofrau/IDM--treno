package idm.servlet.web.controller;

import java.util.Collections;
import java.util.List;

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
	public String eliminaTreno(@RequestParam("id") int id, Model model) {
		model.addAttribute("id", id);
		Treno treno = trenoService.find(id);
		int prezzoTotale = treno.getPrezzoTotale();

		trenoService.delete(id);
		
		Utente utente = utenteService.find(249);
		int bitTrain = utente.getbitTrain();
		utente.setbitTrain(bitTrain + prezzoTotale);
		utenteService.update(utente);

		model.addAttribute("utente", utente);
		List<Treno> treni = trenoService.findByUtenteId(249);

		Collections.reverse(treni);

		model.addAttribute("treni", treni);

		return "redirect:/04-profile";
	}
	

}
