package idm.servlet.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.idm.trenohibernate.ConcreteBuilder;
import com.idm.trenohibernate.TrenoBuilder;
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
	public String cancellaTreno() {
		return "cancellaTreno";
	}
	
	@GetMapping("/cancellato")
	public String trenoCAncellato(@RequestParam("trainID") int id) {
		System.out.println("ID treno da cancellare: " + id);
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
}
