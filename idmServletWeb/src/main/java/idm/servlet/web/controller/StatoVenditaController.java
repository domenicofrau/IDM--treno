package idm.servlet.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.service.TrenoService;

@Controller
public class StatoVenditaController {
	
	@Autowired
	TrenoService trenoService;
	
	@PostMapping("/cambiaStato")
	public String aggiornaStatoVenditaTreno(int idTreno, boolean inVendita, RedirectAttributes redirectAttributes) {
		Treno treno = trenoService.find(idTreno);
	    if(treno != null){
	        treno.setInVendita(inVendita);
	        trenoService.update(treno);
	        redirectAttributes.addFlashAttribute("successMessage", "Stato vendita aggiornato con successo!");
	    } else {
	        redirectAttributes.addFlashAttribute("errorMessage", "Treno non trovato.");
	    }
	    return "redirect:/04-profile";
	}

}
