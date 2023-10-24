package idm.servlet.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.ConcreteBuilder;
import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Vagone;
import com.idm.trenohibernate.VagoneFactory;
import com.idm.trenohibernate.FR.FRCargo;
import com.idm.trenohibernate.FR.FRLocomotiva;
import com.idm.trenohibernate.FR.FRPasseggeri;
import com.idm.trenohibernate.FR.FRRistorante;
import com.idm.trenohibernate.TN.TNCargo;
import com.idm.trenohibernate.TN.TNLocomotiva;
import com.idm.trenohibernate.TN.TNPasseggeri;
import com.idm.trenohibernate.TN.TNRistorante;
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

	public String tipoVagone(Vagone vagone) {
		return vagone.getTipo().toString();
	}
}
