package com.corso.controller;

import java.util.List;

import javax.jws.WebParam;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.corso.spring.model.Categoria;
import com.corso.spring.service.CategoriaService;

@Controller /* figlia di Component */
@RequestMapping("/categoria")
public class CategoriaController {

	@Autowired
	private CategoriaService service; 
	
	
	@RequestMapping(path = { "/", "/home" }
	   , method = { RequestMethod.GET, RequestMethod.POST })
	public String home() {
		return "home";
	}

	@GetMapping("/form_add")
	public String formAdd(Model m) {
		m.addAttribute("categoria", new Categoria());
		return "formAdd";
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute Categoria categoria, Model model) {
		
		System.out.println("form:" + categoria); 

		Categoria c = service.creaCategoria(categoria); 
		System.out.println("creata:" + categoria); 
		model.addAttribute("categoria", categoria); 
		return "viewCategoria";
	}
	
	@GetMapping("/form_search")
	public String formSearch(Model m) {
		return "formSearch";
	}

	@GetMapping("/search")
	public String search(@RequestParam("nome") /* @WebParam(name="nome") */ String nome, Model model ) {
		
		System.out.println("parametro passato 2: " + nome); 
		
		List<Categoria> categorie = service.getCategoriaByName(nome);
		model.addAttribute("categorie",categorie); 
		return "search";
	}
	
	@GetMapping("/search/{nome}")
	public String searchWithPathVariable(@PathVariable String nome ) {
		
		System.out.println("path variable: " + nome); 
		
		return "formSearch";
	}
	
	@DeleteMapping("/delete/{id}")
	public String searchWithPathVariable(@PathVariable int id ) {
		
		System.out.println("cancella categoria " + id); 
		
		return "formSearch";
	}
	
	
}
