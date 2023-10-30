package com.idm.trenohibernate;

import com.idm.trenohibernate.dao.Bean;
import com.idm.trenohibernate.exceptions.SaldoNonSufficenteException;

import java.util.ArrayList;
import java.util.List;

public class Treno implements Bean {

	private int id;
	private String marca;
	private List<Vagone> vagoni = new ArrayList<Vagone>();
	private Utente utente;
	private String nome;
	private String immagine;

	public Treno() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public List<Vagone> getVagoni() {
		return vagoni;
	}

	public void setVagoni(List<Vagone> vagoni) {
		this.vagoni = vagoni;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public void setUtente(Treno treno, Utente utente)throws  SaldoNonSufficenteException{
		List<Vagone> listaVagoni= treno.getVagoni();
		int prezzoTreno =0;
			for(Vagone vagone:listaVagoni) {
				prezzoTreno+=vagone.getPrezzo();
			}
			if(utente.getbitTrain()-prezzoTreno <0) {
				throw new SaldoNonSufficenteException("Saldo non ufficente, il  tuo saldo è: "+utente.getbitTrain()+", sono necessari: ", prezzoTreno);
			}
	utente.setbitTrain(utente.getbitTrain()-prezzoTreno);
	this.utente = utente;
}
	public void vendiTreno(Treno treno, Utente venditore, Utente compratore) {
		List<Vagone> listaVagoni= treno.getVagoni();
		int prezzoTreno =0;
			for(Vagone vagone:listaVagoni) {
				prezzoTreno+=vagone.getPrezzo();
			}
			
	compratore.setbitTrain(compratore.getbitTrain()-prezzoTreno);
	venditore.setbitTrain(venditore.getbitTrain()+prezzoTreno);
	this.utente = compratore;
}
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("Treno Marca: ").append(marca).append("\n");
		sb.append("Vagoni: \n");
		
		for (Vagone v : vagoni) {
			sb.append("\t").append(v).append("\t").append("\n");
		}
		sb.append("Nome treno: ").append(nome).append("\n");
		sb.append("Url immagine: ").append(immagine).append("\n");
		return sb.toString();
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String name) {
		this.nome = name;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

}
