package idm.servlet.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.PasseggeriBusiness;
import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Vagone;
import com.idm.trenohibernate.service.TrenoService;

@Controller
public class CercaController {
	
	@Autowired
	TrenoService trenoService;
	

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
		return "05-train-detail";
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
		return "05-train-detail";
	}

}
