package com.idm.trenohibernate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.dao.TrenoCriteriaDAO;

@Service
public class TrenoServiceCriteria {
	
	
	private TrenoCriteriaDAO criteriaDAO = new TrenoCriteriaDAO();
	
	public List<Treno> findByNameLike(String nome) {
		
		List<Treno> treni = criteriaDAO.findByNameLike(nome);
		
		if(treni.size() != 0) {
			System.out.println("Ho trovato i seguenti treni con un nome simile a " + nome + " :");
			for (Treno t : treni) {
			System.out.println(t);
			}
			
		} else {
			System.out.println("Non esistono treni con un nome simile a " + nome);
		}
		return treni;
	}
	
	public List<Treno> findTreni(String nome, String marca, String regione, int prezzoMin, int prezzoMax) {
		
		List<Treno> treni = criteriaDAO.findTreno(nome, marca, regione, prezzoMin, prezzoMax);
		
		if(treni.size() != 0) {
			System.out.println("Ho trovato i seguenti treni con un nome simile a " + nome + ", marca " + marca + " , regione " + regione
			 + " compreso tra " + prezzoMin + " e " + prezzoMax);
			for (Treno t : treni) {
			System.out.println(t);
			}
		} else {
			System.out.println(nome);
			System.out.println("Non esistono treni con questi parametri");
		}
		return treni;
	}
	
	public List<Treno> findTreniPrezzo(int minPeso, int maxPeso){
		
		List<Treno> treni = criteriaDAO.findByPrezzo(minPeso, maxPeso);
		
		if(treni.size() != 0) {
			System.out.println("Ho trovato i seguenti treni");
			for (Treno t : treni) {
			System.out.println(t);
			}
		} else {
			System.out.println("Non esistono treni");
		}
		return treni;
	}

	

}
