package idm.servlet.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.service.TrenoServiceCriteria;

import idm.servlet.bean.TrenoFilter;

@Controller
public class CriteriaController {
	
	@Autowired
	TrenoServiceCriteria tSvcC;

	@GetMapping("/search")
	public String cerca(@ModelAttribute("treno") TrenoFilter treno, Model model) {
		String nome = treno.getNomeLike();
		String marca = treno.getMarca();
		String regione = treno.getRegione();
		int prezzoMin = treno.getPrezzoMin();
		int prezzoMax = treno.getPrezzoMax();
		boolean isInVendita = treno.isInVendita();
		
	//	model.addAttribute("params", treno);

		List<Treno> treni = tSvcC.findTreni(nome, marca, regione, prezzoMin, prezzoMax, isInVendita);
		model.addAttribute("criteria", treni);
		return "search";
	}

}
