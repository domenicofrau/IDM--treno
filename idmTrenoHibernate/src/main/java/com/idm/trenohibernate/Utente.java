package com.idm.trenohibernate;

import java.util.HashSet;
import java.util.Set;

import com.idm.trenohibernate.dao.Bean;

public class Utente implements Bean {

	private int id;
	private String nome;
	private String cognome;
	private String email;
	private String password;
	private int bitTrain;
	private String immagineProfilo;
	private String nazione;
	private Set<Treno> treni = new HashSet<Treno>();

	public Utente(int id, String nome, String cognome, String email, String password, String immagineUtente,
			String nazione) {
		super();
		this.id = id;
		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
		this.password = password;
		this.immagineProfilo = immagineUtente;
		this.nazione = nazione;
	}

	public Utente() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Treno> getTreni() {
		return treni;
	}

	public void setTreni(Set<Treno> treni) {
		this.treni = treni;
	}

	@Override
	public String toString() {
		return "Utente [id=" + id + ", nome=" + nome + ", cognome=" + cognome + ", email=" + email + ", password="
				+ password + ", treno=" + treni + "]";
	}

	public int getbitTrain() {
		return bitTrain;
	}

	public void setbitTrain(int bitTrain) {
		this.bitTrain = bitTrain;
	}

	public String getImmagineProfilo() {
		return immagineProfilo;
	}

	public void setImmagineProfilo(String immagineProfilo) {
		this.immagineProfilo = immagineProfilo;
	}

	public String getNazione() {
		return nazione;
	}

	public void setNazione(String nazione) {
		this.nazione = nazione;
	}

}