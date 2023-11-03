package idm.servlet.web.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.UtenteBuilder;
import com.idm.trenohibernate.Vagone;
import com.idm.trenohibernate.VagoneFactory;
import com.idm.trenohibernate.exceptions.TrenoException;
import com.idm.trenohibernate.exceptions.UtenteException;
import com.idm.trenohibernate.service.TrenoService;
import com.idm.trenohibernate.service.TrenoServiceCriteria;
import com.idm.trenohibernate.service.UtenteService;
import com.idm.trenohibernate.utils.HibernateUtil;

import idm.servlet.bean.TrenoBean;
import idm.servlet.bean.UtenteBean;

@SuppressWarnings("unused")
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
	UtenteBuilder utenteBuilder;
	@Autowired
	ConcreteBuilder concreteBuilder;

	@Autowired
	UtenteService utenteService;

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
	public String addFR(@ModelAttribute("treno") TrenoBean treno, Model model) {
		System.out.println("creata:" + treno.getSigla());
		String sigla = treno.getSigla();
		String nome = treno.getNomeTreno();
		String immagine = treno.getUrlImmagine();
		String regione = treno.getRegione();
		List<Utente> listaUtenti = utenteService.findAll();

		try {
			Treno t = concreteBuilder.costruisciTreno(sigla, nome, immagine, regione, frFactory);
			Utente u = (listaUtenti.get(0));
			t.setUtente(u);
			trenoService.crea(t);

			int bitTrain = u.getbitTrain();
			int prezzoTotale = t.getPrezzoTotale();
			u.setbitTrain(bitTrain - prezzoTotale);
			utenteService.update(u);

		} catch (TrenoException e) {
			e.printStackTrace();
		}

		model.addAttribute("siglaTreno", treno.getSigla());
		model.addAttribute("nomeTreno", treno.getNomeTreno());
		model.addAttribute("urlImmagine", treno.getUrlImmagine());
		model.addAttribute("regione", treno.getRegione());
		return "redirect:/03-home";
	}

	@PostMapping("/crea-treno-tn")
	public String addTN(@ModelAttribute("treno") TrenoBean treno, Model model) {
		System.out.println("creata:" + treno.getSigla());
		String sigla = treno.getSigla();
		String nome = treno.getNomeTreno();
		String immagine = treno.getUrlImmagine();
		String regione = treno.getRegione();

		List<Utente> listaUtenti = utenteService.findAll();
		try {
			Treno t = concreteBuilder.costruisciTreno(sigla, nome, immagine, regione, tnFactory);
			Utente u = (listaUtenti.get(0));
			t.setUtente(u);
			trenoService.crea(t);

			int bitTrain = u.getbitTrain();
			int prezzoTotale = t.getPrezzoTotale();
			u.setbitTrain(bitTrain - prezzoTotale);
			utenteService.update(u);

		} catch (TrenoException e) {
			e.printStackTrace();
		}

		model.addAttribute("siglaTreno", treno.getSigla());
		model.addAttribute("nomeTreno", treno.getNomeTreno());
		model.addAttribute("urlImmagine", treno.getUrlImmagine());
		model.addAttribute("regione", treno.getRegione());
		return "redirect:/03-home";
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

	@GetMapping("/cerca-treno-nome")
	public String cercaTrenoByName(String nome, Model model) {
		try {
			Treno treno = trenoService.findByName(nome);
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

	@PostMapping("/eliminaTreno")
	public String eliminaTreno(@RequestParam("id") int id, Model model) {
		model.addAttribute("id", id);
		Treno treno = trenoService.find(id);
		int prezzoTotale = treno.getPrezzoTotale();

		trenoService.delete(id);

		Utente utente = utenteService.find(2096);
		int bitTrain = utente.getbitTrain();
		utente.setbitTrain(bitTrain + prezzoTotale);
		utenteService.update(utente);

		model.addAttribute("utente", utente);
		List<Treno> treni = trenoService.findByUtenteId(2096);

		Collections.reverse(treni);

		model.addAttribute("treni", treni);

		return "redirect:/04-profile";
	}

	@GetMapping("/01-welcome")
	public String welcome(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Object loggedInUser = session.getAttribute("loggedInUser");
		 if (loggedInUser != null) {
	            model.addAttribute("loggedInUser", loggedInUser);
	        } else {
	            model.addAttribute("errorMessage", "User not logged in");
	        }
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
		Utente utente = utenteService.find(2096);
		model.addAttribute("utente", utente);
		List<Treno> treni = trenoService.findByUtenteId(2096);

		Collections.reverse(treni);

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

	@PostMapping("doRegister")
	public String addUtente(@ModelAttribute("utente") UtenteBean utente, Model model) {
		String nomeUtente = utente.getNome();
		String cognomeUtente = utente.getCognome();
		String emailUtente = utente.getEmail();
		String passwordUtente = utente.getPassword();
		String immagine = utente.getProfilePic();
		try {
			Utente u = utenteBuilder.creaUtente(nomeUtente, cognomeUtente, emailUtente, passwordUtente,
					immagine.replace(",", ""));
			utenteService.crea(u);
		} catch (UtenteException e) {
			e.printStackTrace();
		}
		return "redirect:/utente-creato";
	}

	// CONTROLLER PRONTO PER OSPITARE LOGIN PAGE
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
}
