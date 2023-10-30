package com.idm.trenohibernate;

public class UtenteBuilder {

	public Utente creaUtente(String nome, String cognome, String email, String password) {
		Utente u = new Utente();
		u.setNome(nome);
		u.setCognome(cognome);
		u.setEmail(email);
		u.setPassword(password);
		return u;
	}

	public Utente setUtente(String nome, String cognome, String email, String password) {
		return null;
	}
}