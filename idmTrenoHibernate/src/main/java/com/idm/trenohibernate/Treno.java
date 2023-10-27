package com.idm.trenohibernate;

import java.util.ArrayList;
import java.util.List;

import com.idm.trenohibernate.dao.Bean;

public class Treno implements Bean {

	private List<Vagone> vagoni = new ArrayList<Vagone>();

	private int id;
	private String marca;
	private int prezzoTotaleVagoni;
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

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("Treno Marca: ").append(marca).append("\n");
		sb.append("Vagoni: \n");
		
		for (Vagone v : vagoni) {
			sb.append("\t").append(v).append("\t").append("\n");
		}
		sb.append("Prezzo totale treno: "+	prezzoTotaleVagoni);
		return sb.toString();
	}

	public List<Vagone> getVagoni() {
		return vagoni;
	}

	public void setVagoni(List<Vagone> vagoni) {
		this.vagoni = vagoni;
	}

	public int getPrezzoTotaleVagoni() {
		return prezzoTotaleVagoni;
	}

	public void setPrezzoTotaleVagoni(int prezzoTotaleVagoni) {
		this.prezzoTotaleVagoni = prezzoTotaleVagoni;
	}



}
