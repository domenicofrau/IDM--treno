package idm.servlet.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.ConcreteBuilder;
import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.PasseggeriBusiness;
import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Vagone;
import com.idm.trenohibernate.VagoneFactory;
import com.idm.trenohibernate.exceptions.TrenoException;
import com.idm.trenohibernate.service.TrenoService;

import idm.servlet.bean.SiglaTreno;
import idm.servlet.bean.NomeTreno;
import idm.servlet.bean.UrlImmagine;
@Controller
public class TrenoController {

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

	@GetMapping("/cancella")
	public String cancellaTreno(Model model) {
		List<Treno> listaTreni = trenoService.findAll();
		model.addAttribute("treni", listaTreni);
		return "cancellaTreno";
	}

	@GetMapping("/cancellato")
	public String trenoCAncellato(@RequestParam("trainID") int id, Model model) {
		System.out.println("ID treno da cancellare: " + id);
		model.addAttribute("id", id);
		trenoService.delete(id);
		return "cancellato";
	}

	@PostMapping("/crea-treno-fr")
	public String addFR(@ModelAttribute("siglaTreno") SiglaTreno siglaTreno,@ModelAttribute("nomeTreno") NomeTreno nomeTreno,@ModelAttribute("urlImmagine") UrlImmagine urlImmagine, Model model) {
		System.out.println("creata:" + siglaTreno.getSigla());
		String sigla=siglaTreno.getSigla().toUpperCase();
		String nome= nomeTreno.getNomeTreno();
		String immagine = urlImmagine.getUrlImmagine();
		try {
			trenoService.crea(concreteBuilder.costruisciTreno(sigla, nome, immagine, frFactory));
		} catch (TrenoException  e) {
			e.printStackTrace();
		}

		model.addAttribute("siglaTreno", siglaTreno.getSigla().toUpperCase());
		model.addAttribute("nomeTreno", nomeTreno.getNomeTreno());
		model.addAttribute("urlImmagine", urlImmagine.getUrlImmagine());
		return "viewTreno";
	}

	@PostMapping("/crea-treno-tn")
	public String addTN(@ModelAttribute("siglaTreno") SiglaTreno siglaTreno,@ModelAttribute("nomeTreno") NomeTreno nomeTreno,@ModelAttribute("urlImmagine") UrlImmagine urlImmagine, Model model) {
		System.out.println("creata:" + siglaTreno.getSigla());
		String sigla=siglaTreno.getSigla();
		String nome= nomeTreno.getNomeTreno();
		String url = urlImmagine.getUrlImmagine();

		try {
			trenoService.crea(concreteBuilder.costruisciTreno(sigla, nome,url, tnFactory));
		} catch (TrenoException e) {
			e.printStackTrace();
		}

		model.addAttribute("siglaTreno", siglaTreno.getSigla());
		model.addAttribute("nomeTreno", nomeTreno.getNomeTreno());
		model.addAttribute("urlImmagine", urlImmagine.getUrlImmagine());
		return "viewTreno";
	}

	@GetMapping("/cerca-treno")
	public String cercaTreno(String idTrenoStr, Model model) {
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
				    model.addAttribute("cargo", cargoV);
				    model.addAttribute("locomotive", locomotivaV);
				    model.addAttribute("ristoranti", ristoranteV);
				    model.addAttribute("passeggeri", passeggeriV);
				    model.addAttribute("passeggeriB", passeggeriVBusiness);
				}

			} else {
				model.addAttribute("errore", "Nessun treno trovato con l'ID specificato.");
			}
		} catch (NumberFormatException e) {
			model.addAttribute("errore", "L'ID del treno deve essere un numero intero.");
		}
		model.addAttribute("controller", this);
		return "trovaTreno";
	}

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
		if (treni.size() != 0) {
			model.addAttribute("treni", treni);
		} else {
			model.addAttribute("errore", "Al momento non ci sono treni da vedere... creane uno tu!");
		}
		return "03-home";
	}

	@GetMapping("/04-profile")
	public String profile(Model model) {
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