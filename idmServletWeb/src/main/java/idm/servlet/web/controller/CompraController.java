package idm.servlet.web.controller;

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
import com.idm.trenohibernate.exceptions.SaldoNonSufficenteException;
import com.idm.trenohibernate.service.TrenoService;
import com.idm.trenohibernate.service.UtenteService;

@Controller
public class CompraController {

	@Autowired
	TrenoService trenoService;
	
	@Autowired
	UtenteService utenteService;
	

	@PostMapping("/compraTreno")
	public String compraTreno(@RequestParam("id") int id, HttpServletRequest request, Model model) throws SaldoNonSufficenteException {
	    HttpSession session = request.getSession();
	    Utente compratore = (Utente) session.getAttribute("loggedInUser");
	    
	    Treno treno = trenoService.find(id);
	    Utente venditore = treno.getUtente();
	    
	    trenoService.vendiTreno(treno, venditore, compratore);
	    
	    
	    utenteService.update(venditore);
	    utenteService.update(compratore);

	    return "redirect:/03-home";
	}
	
}
