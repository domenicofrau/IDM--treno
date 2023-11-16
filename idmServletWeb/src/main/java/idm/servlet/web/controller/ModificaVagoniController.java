package idm.servlet.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.idm.trenohibernate.*;
import com.idm.trenohibernate.ConcreteBuilder;
import com.idm.trenohibernate.PasseggeriBusiness;
import com.idm.trenohibernate.VagoneFactory;
import com.idm.trenohibernate.exceptions.TrenoException;
import com.idm.trenohibernate.exceptions.UtenteException;
import com.idm.trenohibernate.service.TrenoService;
import com.idm.trenohibernate.service.UtenteService;
import com.idm.trenohibernate.service.VagoneService;
import idm.servlet.bean.TrenoBean;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
@Controller
public class ModificaVagoniController {
	@Autowired
	@Qualifier("FRVagoneFactory")
	VagoneFactory frFactory;

	@Autowired
	@Qualifier("TNVagoneFactory")
	VagoneFactory tnFactory;

	@Autowired
	TrenoService trenoService;
	@Autowired
	VagoneService vagoneService;
	@Autowired
	ConcreteBuilder concreteBuilder;
	
	@Autowired
	UtenteService utenteService;
	
	
	@PostMapping("aggiungiPasseggeri")
	public String addPasseggeri(@RequestParam("nomeTreno") String nomeTreno, Model model,HttpSession session) throws UtenteException, TrenoException {
		System.out.println("ciao");
		Treno t = trenoService.findByName(nomeTreno);
	    
	    if (t != null) {
	        concreteBuilder.addVagonePasseggeri(t);
	    }else {
	        model.addAttribute("errorMessage", "Treno non trovato");
	    }
	    Treno tUpdated= trenoService.findByName(nomeTreno);
	   System.out.println("******************************Sono Vagoni******************************"+tUpdated.getVagoni()); 
        model.addAttribute("message", "Vagone passeggeri aggiunto con successo!");
		List<Cargo> cargoV = new ArrayList<>();
		List<Ristorante> ristoranteV = new ArrayList<>();
		List<Locomotiva> locomotivaV = new ArrayList<>();
		List<Passeggeri> passeggeriV = new ArrayList<>();
		List<Passeggeri> passeggeriVBusiness = new ArrayList<>();
		for (Vagone vagone : t.getVagoni()) {
			if(vagone!=null) {
				if (vagone instanceof Cargo) {
					Cargo cargo = (Cargo) vagone;
					cargoV.add(cargo);
				}
				if (vagone instanceof Ristorante) {
					Ristorante ristorante = (Ristorante) vagone;
					ristoranteV.add(ristorante);
				}
				if (vagone instanceof Locomotiva) {
					Locomotiva locomotiva = (Locomotiva) vagone;
					locomotivaV.add(locomotiva);
				}
				if (vagone instanceof Passeggeri) {
					Passeggeri passeggeri = (Passeggeri) vagone;
					passeggeriV.add(passeggeri);
				}
				if (vagone instanceof PasseggeriBusiness) {
					PasseggeriBusiness passeggeriBusiness = (PasseggeriBusiness) vagone;
					passeggeriVBusiness.add(passeggeriBusiness);
				}
			}
		}
		model.asMap().clear();
		model.addAttribute("cargo", cargoV);
		model.addAttribute("locomotive", locomotivaV);
		model.addAttribute("ristoranti", ristoranteV);
		model.addAttribute("passeggeri", passeggeriV);
		model.addAttribute("passeggeriB", passeggeriVBusiness);
	    Utente u = utenteService.findByName(t.getUtente().getNome());
	    session.setAttribute("loggedInUser", u);
	    model.addAttribute("controller", this);
	    model.addAttribute("treno", t);
	    return "08-modifica-treno";
	}
	@PostMapping("/aggiungiBusiness")
	public String addBusiness(@RequestParam("nomeTreno") String nomeTreno, Model model,HttpSession session)throws UtenteException, TrenoException {
		Treno t = trenoService.findByName(nomeTreno);
		if(t!=null) {
			concreteBuilder.addVagonePasseggeriBusiness(t);
		}else {
	        model.addAttribute("errorMessage", "Treno non trovato");
	    }
	    Treno tUpdated= trenoService.findByName(nomeTreno);
	   System.out.println("******************************Sono Vagoni******************************"+tUpdated.getVagoni()); 
        model.addAttribute("message", "Vagone passeggeri aggiunto con successo!");
		List<Cargo> cargoV = new ArrayList<>();
		List<Ristorante> ristoranteV = new ArrayList<>();
		List<Locomotiva> locomotivaV = new ArrayList<>();
		List<Passeggeri> passeggeriV = new ArrayList<>();
		List<Passeggeri> passeggeriVBusiness = new ArrayList<>();
		for (Vagone vagone : t.getVagoni()) {
			if(vagone!=null) {
				if (vagone instanceof Cargo) {
					Cargo cargo = (Cargo) vagone;
					cargoV.add(cargo);
				}
				if (vagone instanceof Ristorante) {
					Ristorante ristorante = (Ristorante) vagone;
					ristoranteV.add(ristorante);
				}
				if (vagone instanceof Locomotiva) {
					Locomotiva locomotiva = (Locomotiva) vagone;
					locomotivaV.add(locomotiva);
				}
				if (vagone instanceof Passeggeri) {
					Passeggeri passeggeri = (Passeggeri) vagone;
					passeggeriV.add(passeggeri);
				}
				if (vagone instanceof PasseggeriBusiness) {
					PasseggeriBusiness passeggeriBusiness = (PasseggeriBusiness) vagone;
					passeggeriVBusiness.add(passeggeriBusiness);
				}
			}
		}
		model.asMap().clear();
		model.addAttribute("cargo", cargoV);
		model.addAttribute("locomotive", locomotivaV);
		model.addAttribute("ristoranti", ristoranteV);
		model.addAttribute("passeggeri", passeggeriV);
		model.addAttribute("passeggeriB", passeggeriVBusiness);
	    Utente u = utenteService.findByName(t.getUtente().getNome());
	    session.setAttribute("loggedInUser", u);
	    model.addAttribute("controller", this);
	    model.addAttribute("treno", t);
			
		return "08-modifica-treno";
	}
	@PostMapping("/aggiungi-vLocomotiva")
	public String addLocomotiva(@ModelAttribute("treno") TrenoBean treno, Model model)throws UtenteException, TrenoException {
		Treno t = trenoService.findByName(treno.getNomeTreno());
			concreteBuilder.addVagoneLocomotiva(t);
			return "08-modifica-treno";
	}
	@PostMapping("/aggiungi-vCargo")
	public String addCargo(@ModelAttribute("treno") TrenoBean treno, Model model)throws UtenteException, TrenoException {
		Treno t = trenoService.findByName(treno.getNomeTreno());
			concreteBuilder.addVagoneCargo(t);
			return "08-modifica-treno";
	}
	@PostMapping("/aggiungi-vRistorante")
	public String addRistorante(@ModelAttribute("treno") TrenoBean treno, Model model)throws UtenteException, TrenoException {
		Treno t = trenoService.findByName(treno.getNomeTreno());
			concreteBuilder.addVagoneRistorante(t);
			return "08-modifica-treno";
	}
	
	@PostMapping("/rimuovi-vagone")
	public String rimuoviVagone(@ModelAttribute("treno")TrenoBean treno, Vagone vagone, Model model)throws TrenoException{
		Treno t = trenoService.findByName(treno.getNomeTreno());
		vagoneService.rimuoviVagone(vagone.getId());
		return "08-modifica-treno";
	}
}
