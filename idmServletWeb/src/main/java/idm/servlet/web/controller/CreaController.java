package idm.servlet.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.idm.trenohibernate.ConcreteBuilder;
import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.VagoneFactory;
import com.idm.trenohibernate.exceptions.SaldoNonSufficenteException;
import com.idm.trenohibernate.exceptions.TrenoException;
import com.idm.trenohibernate.service.TrenoService;
import com.idm.trenohibernate.service.UtenteService;

import idm.servlet.bean.TrenoBean;

@Controller
public class CreaController {
	
	@Autowired
	@Qualifier("FRVagoneFactory")
	VagoneFactory frFactory;

	@Autowired
	@Qualifier("TNVagoneFactory")
	VagoneFactory tnFactory;

	@Autowired
	TrenoService trenoService;

	@Autowired
	ConcreteBuilder concreteBuilder;
	
	@Autowired
	UtenteService utenteService;
	
	@PostMapping("/crea-treno-fr")
	public String addFR(@ModelAttribute("treno") TrenoBean treno,HttpServletRequest request, Model model) throws SaldoNonSufficenteException {
		System.out.println("creata:" + treno.getSigla());
		String sigla = treno.getSigla();
		String nome = treno.getNomeTreno();
		String immagine = treno.getUrlImmagine();
		String regione = treno.getRegione();
		boolean inVendita = treno.isInVendita();
		HttpSession session = request.getSession();
		Utente u= (Utente) session.getAttribute("loggedInUser");
		try {		
			Treno t = concreteBuilder.costruisciTreno(sigla, nome, immagine.replace(",", ""), regione, inVendita, frFactory);
			
			t.setUtente(t, u);
			trenoService.crea(t);
			utenteService.update(u);

		} catch (TrenoException e) {
			e.printStackTrace();
		}

		model.addAttribute("siglaTreno", treno.getSigla());
		model.addAttribute("nomeTreno", treno.getNomeTreno());
		model.addAttribute("urlImmagine", treno.getUrlImmagine());
		model.addAttribute("regione", treno.getRegione());
		model.addAttribute("inVendita", treno.isInVendita());
		return "redirect:/03-home";
	}

	@PostMapping("/crea-treno-tn")
	public String addTN(@ModelAttribute("treno") TrenoBean treno,HttpServletRequest request, Model model) throws SaldoNonSufficenteException {
		System.out.println("creata:" + treno.getSigla());
		String sigla = treno.getSigla();
		String nome = treno.getNomeTreno();
		String immagine = treno.getUrlImmagine();
		String regione = treno.getRegione();
		boolean inVendita = treno.isInVendita();
		
		HttpSession session = request.getSession();
		Utente u= (Utente) session.getAttribute("loggedInUser");
		try {			
			Treno t = concreteBuilder.costruisciTreno(sigla, nome,immagine.replace(",", ""), regione, inVendita, tnFactory);
			
			t.setUtente(t, u);
			trenoService.crea(t);
			utenteService.update(u);

		} catch (TrenoException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("siglaTreno", treno.getSigla());
		model.addAttribute("nomeTreno", treno.getNomeTreno());
		model.addAttribute("urlImmagine", treno.getUrlImmagine());
		model.addAttribute("regione", treno.getRegione());
		model.addAttribute("inVendita", treno.isInVendita());
		return "redirect:/03-home";
	}

}
