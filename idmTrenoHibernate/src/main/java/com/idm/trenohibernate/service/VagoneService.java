package com.idm.trenohibernate.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.Vagone;
import com.idm.trenohibernate.dao.*;
@Transactional
@Component
public class VagoneService {
	private VagoneDAO vDao= new VagoneDAOImpl();
	TrenoService tService = new TrenoService();
	UtenteService uService = new UtenteService();
	public void aggiungiVagone(Vagone vagone, Treno t) {
		vagone.setTreno(t);
		Integer id = vDao.create(vagone);
		t.getVagoni().add(vagone);
		int prezzoTotale=t.ricalcolaPrezzo(t.getVagoni());
		t.setPrezzoTotale(prezzoTotale);
		tService.update(t);
		System.out.println("Creato il vagone con id: " + id + " assegnato al treno " + vagone.getTreno().getId());
	}
	
	public void rimuoviVagone(Integer id) {
		vDao.deleteById(id);
	}
}
