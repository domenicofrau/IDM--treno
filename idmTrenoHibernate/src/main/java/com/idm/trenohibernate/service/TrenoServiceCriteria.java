package com.idm.trenohibernate.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.dao.TrenoCriteriaDAO;

@Service
public class TrenoServiceCriteria {
	
	private TrenoCriteriaDAO criteriaDAO = new TrenoCriteriaDAO();
	
	public List<Treno> findTreni(String nome, String marca, String regione, int prezzoMin, int prezzoMax, boolean isInVendita) {
		
		List<Treno> treni = criteriaDAO.findTreno(nome, marca, regione, prezzoMin, prezzoMax, isInVendita);
		
		if(treni.size() != 0) {
			System.out.println("Ho trovato i seguenti treni con un nome simile a " + nome + ", marca " + marca + " , regione " + regione
			 + " compreso tra " + prezzoMin + " e " + prezzoMax + " . Il treno è in vendita: " + isInVendita);
			for (Treno t : treni) {
			System.out.println(t);
			}
		} else {
			System.out.println(nome);
			System.out.println("Non esistono treni con questi parametri");
		}
		return treni;
	}

}
