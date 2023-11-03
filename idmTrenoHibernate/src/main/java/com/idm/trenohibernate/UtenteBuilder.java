package com.idm.trenohibernate;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

import com.idm.trenohibernate.exceptions.*;
import com.idm.trenohibernate.service.*;

@Component
public class UtenteBuilder {
	private static String HashPassword(String password) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		byte[] hashBytes = md.digest(password.getBytes());
		StringBuilder sb = new StringBuilder();
		for (byte b : hashBytes) {
			sb.append(String.format("%02x", b));
		}
		return sb.toString();
	}

	UtenteService uService = new UtenteService();

	public Utente creaUtente(String nome, String cognome, String email, String password, String profilePic)
			throws UtenteException {

		if (uService.findByEmail(email) != null) {
			throw new CannotCreateUserException("La mail esiste già!!", email);
		}
		try {
			Utente u = new Utente();
			u.setNome(nome);
			u.setCognome(cognome);
			u.setEmail(email);
			u.setPassword(HashPassword(password));
			u.setbitTrain(2000);
			u.setImmagineProfilo(profilePic);
			return u;
		}
		catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

}