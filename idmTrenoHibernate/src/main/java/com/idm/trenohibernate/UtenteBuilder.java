package com.idm.trenohibernate;

import com.idm.trenohibernate.exceptions.*;
import com.idm.trenohibernate.service.*;
public class UtenteBuilder {
	UtenteService uService= new UtenteService(); 
	public Utente creaUtente(String nome, String cognome, String email, String password) throws UtenteException {
		if (uService.findByEmail(email)!=null) {
			throw new CannotCreateUserException("La mail esiste già!!", email);
		}
		Utente u = new Utente();
		u.setNome(nome);
		u.setCognome(cognome);
		u.setEmail(email);
		u.setPassword(password);
		u.setbitTrain(2000);
		return u;
	}


}