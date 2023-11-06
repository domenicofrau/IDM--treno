package idm.servlet.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.exceptions.TrenoException;
import com.idm.trenohibernate.service.TrenoServiceCriteria;

import idm.servlet.bean.TrenoBean;
import idm.servlet.bean.TrenoFilter;

@Controller
public class CriteriaController {
	
	@Autowired
	TrenoServiceCriteria tSvcC;
	
	@GetMapping("/search")
	public String criteria(String nome, String marca, String regione, Model model) {
		List<Treno> treni = tSvcC.findTreni(nome, marca, regione);
		model.addAttribute("criteria", treni);
		return "search";
	}
	
//	@GetMapping("/search")
//	public String cerca(@ModelAttribute("treno") TrenoFilter treno, Model model) {
//		String nome= treno.getNomeLike();
//		String marca = treno.getMarca();
//
//		trenoService.crea(t);
//		} catch (TrenoException  e) {
//			e.printStackTrace();
//		}
//		
//		model.addAttribute("siglaTreno", treno.getSigla());
//		model.addAttribute("nomeTreno", treno.getNomeTreno());
//		model.addAttribute("urlImmagine", treno.getUrlImmagine());		
//		return "viewTreno";
//	}

}
