package idm.servlet.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.idm.trenohibernate.ConcreteBuilder;
import com.idm.trenohibernate.TrenoBuilder;
import com.idm.trenohibernate.exceptions.LocomotivaException;
import com.idm.trenohibernate.exceptions.RistoranteException;
import com.idm.trenohibernate.exceptions.VagoniIncompatibiliException;
import com.idm.trenohibernate.service.TrenoService;

import idm.servlet.bean.SiglaTreno;


@Controller
public class TrenoController {
	@Autowired
	TrenoService trenoService;
	@Autowired
	ConcreteBuilder concreteBuilder;
	
	@GetMapping("/aggiungi-treno")
	public String formAdd(Model m) {
		SiglaTreno sigla = new SiglaTreno();
		m.addAttribute("siglaTreno",  sigla);
		return "creaTreno";
	}
	@PostMapping("/crea-treno")
	public String add(@ModelAttribute("siglaTreno") SiglaTreno siglaTreno, Model model) {
		System.out.println("creata:" + siglaTreno.getSigla()); 
		
		try {
			trenoService.crea(concreteBuilder.costruisciTreno(siglaTreno.getSigla()));
		} catch (LocomotivaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (VagoniIncompatibiliException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RistoranteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		model.addAttribute("siglaTreno", siglaTreno.getSigla()); 
		return "viewTreno";
	}
}
