package com.idm.trenohibernate;

import com.idm.trenohibernate.dao.Bean;
import java.util.ArrayList;
import java.util.List;

public class Treno implements Bean {

	private int id;
	private String marca;
	private List<Vagone> vagoni = new ArrayList<Vagone>();
	private Utente utente;
	private String nome;

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

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("Nome treno: ").append(nome).append("\n");
		sb.append("Treno Marca: ").append(marca).append("\n");
		sb.append("Utente").append(utente);
		sb.append("Vagoni: \n");
		
		for (Vagone v : vagoni) {
			sb.append("\t").append(v).append("\t").append("\n");
		}
		return sb.toString();
	}

}
