package com.idm.trenohibernate.dao;


import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.Vagone;
import com.idm.trenohibernate.service.*;
public class VagoneDAOImpl extends BaseDAO<Vagone> implements VagoneDAO{
	TrenoService tService = new TrenoService();
	UtenteService uService = new UtenteService();
	@Override
	public Integer create(Vagone vagone) {
		return super.create(vagone);
	}

	@Override
	public void update(Vagone bean) {
		 super.update(bean);
	}
	
	@Override
			public void deleteById(int i) {
				Vagone v=(Vagone) super.find((Vagone.class),i);
				
				if (v != null) {
					Treno t = tService.find(v.getTreno().getId());
				
					Utente u =uService.find(t.getUtente().getId());
		
					int refund= v.getPrezzo();
					u.setbitTrain(u.getbitTrain()+refund);
					
					List<Vagone> nonNullVagoni = t.getVagoni().stream()
				                .filter(Objects::nonNull)
				                .collect(Collectors.toList());
					nonNullVagoni.remove(v);
					System.out.println(nonNullVagoni);
					t.setPrezzoTotale(t.ricalcolaPrezzo(nonNullVagoni)-refund);
					
					tService.update(t);
					uService.update(u);
					super.deleteById(v);				
//					List<Vagone>listaVagoni= t.getVagoni();
//					listaVagoni.remove(v);
//					t.setVagoni(listaVagoni);
//					tService.update(t);
					System.out.println("Vagone rimosso");
				} else {
				    System.out.println("Vagone not found for ID: " + i);
				}	
				
			}

	@Override
	public Vagone find(Integer id) {
		return (Vagone) super.find(Vagone.class, id);
	}

}