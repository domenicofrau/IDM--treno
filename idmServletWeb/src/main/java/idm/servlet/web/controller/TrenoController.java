package idm.servlet.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.idm.trenohibernate.ConcreteBuilder;
import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.VagoneFactory;
import com.idm.trenohibernate.exceptions.LocomotivaException;
import com.idm.trenohibernate.exceptions.RistoranteException;
import com.idm.trenohibernate.exceptions.VagoniIncompatibiliException;
import com.idm.trenohibernate.service.TrenoService;

import idm.servlet.bean.SiglaTreno;

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

	@GetMapping("/seleziona-factory")
	public String selezionaFactory(String factory, Model model) {
		model.addAttribute("selectedFactory", factory);
		return "creaTreno";
	}

	@PostMapping("/crea-treno-fr")
	public String addFR(@ModelAttribute("siglaTreno") SiglaTreno siglaTreno, Model model) {
		System.out.println("creata:" + siglaTreno.getSigla());

		try {
			trenoService.crea(concreteBuilder.costruisciTreno(siglaTreno.getSigla(), frFactory));
		} catch (LocomotivaException | VagoniIncompatibiliException | RistoranteException e) {
			e.printStackTrace();
		}

		model.addAttribute("siglaTreno", siglaTreno.getSigla());
		return "viewTreno";
	}

	@PostMapping("/crea-treno-tn")
	public String addTN(@ModelAttribute("siglaTreno") SiglaTreno siglaTreno, Model model) {
		System.out.println("creata:" + siglaTreno.getSigla());

		try {
			trenoService.crea(concreteBuilder.costruisciTreno(siglaTreno.getSigla(), tnFactory));
		} catch (LocomotivaException | VagoniIncompatibiliException | RistoranteException e) {
			e.printStackTrace();
		}

		model.addAttribute("siglaTreno", siglaTreno.getSigla());
		return "viewTreno";
	}

	@GetMapping("/cerca-treno")
	public String cercaTreno(String idTrenoStr, Model model) {
		try {
			Integer idTreno = Integer.parseInt(idTrenoStr);
			Treno treno = trenoService.find(idTreno);
			if (treno != null) {
				model.addAttribute("treno", treno);
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

}