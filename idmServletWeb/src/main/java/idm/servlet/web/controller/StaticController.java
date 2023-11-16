package idm.servlet.web.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.PasseggeriBusiness;
import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.Vagone;
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
	public String welcome(Model model) {
		return "01-welcome";
	}

	@GetMapping("/02-login")
	public String login(Model model) {
		return "02-login";
	}
	
	@GetMapping("/03-home")
	public String home(Model model) {


		List<Treno> treni = trenoService.findAll();
		
		Collections.reverse(treni);
		
		if (treni.size() != 0) {
			model.addAttribute("treni", treni);
		} else {
			model.addAttribute("errore", "Al momento non ci sono treni da vedere... creane uno tu!");
		}
		return "03-home";
	}
	
	@GetMapping("/04-profile")
	public String profile(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Utente u= (Utente) session.getAttribute("loggedInUser");
		
		
		model.addAttribute("utente", u);
		List<Treno> treni = trenoService.findByUtenteId(u.getId());

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
	
	@GetMapping("/07-about")
	public String about(Model model) {
		return "07-about";
	}
	
	@GetMapping("/modifica-treno")
	public String modifica(String idTrenoStr, Model model) {
		try {
			Integer idTreno = Integer.parseInt(idTrenoStr);
			Treno treno = trenoService.find(idTreno);
			if (treno != null) {
				model.addAttribute("treno", treno);

				List<Vagone> vagoni = treno.getVagoni();

				List<Cargo> cargoV = new ArrayList<>();
				List<Ristorante> ristoranteV = new ArrayList<>();
				List<Locomotiva> locomotivaV = new ArrayList<>();
				List<Passeggeri> passeggeriV = new ArrayList<>();
				List<Passeggeri> passeggeriVBusiness = new ArrayList<>();
				for (Vagone vagone : treno.getVagoni()) {
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
	//			model.asMap().clear();
				model.addAttribute("cargo", cargoV);
				model.addAttribute("locomotive", locomotivaV);
				model.addAttribute("ristoranti", ristoranteV);
				model.addAttribute("passeggeri", passeggeriV);
				model.addAttribute("passeggeriB", passeggeriVBusiness);

			} else {
				model.addAttribute("errore", "Nessun treno trovato con l'ID specificato.");
			}
		} catch (NumberFormatException e) {
			model.addAttribute("errore", "L'ID del treno deve essere un numero intero.");
		}
		model.addAttribute("controller", this);
		return "08-modifica-treno";
	}
	
	@GetMapping("/09-benvenuto")
	public String benvenuto(Model model) {
		return "09-benvenuto";
	}
	
	@GetMapping("/develop")
	public String develop(Model model) {
		return "develop";
	}

	
	
//	@PostMapping("/modifica-treno1")
//	public String modificaTreno(Treno treno ) {
//		Treno t = trenoService.find(treno.getId());
//		t.setVagoni(null);
//		trenoService.update(t);
//		
//	}

}

