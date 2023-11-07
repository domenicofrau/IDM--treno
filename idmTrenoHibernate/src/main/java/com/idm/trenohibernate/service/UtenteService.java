package com.idm.trenohibernate.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.stereotype.Component;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.dao.*;
import com.idm.trenohibernate.exceptions.UtenteException;

@Component
public class UtenteService {

	@SuppressWarnings("unused")
		private static String HashPassword(String password) throws NoSuchAlgorithmException {
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        byte[] hashBytes = md.digest(password.getBytes());
	        StringBuilder sb = new StringBuilder();
	        for (byte b : hashBytes) {
	            sb.append(String.format("%02x", b));
	        }
	        return sb.toString();
	    }

	private UtenteDAO dao = new UtenteDAOImpl();

	public void crea(Utente utente) {
		Integer id = dao.create(utente);
		System.out.println("Creato l'utente con id: " + id);
	}
	

	public void update(Utente utente) {
		dao.update(utente);
		System.out.println("Modificato l'utente con id: " + utente.getId());
	}

	public Utente find(Integer id) {
		Utente u = dao.find(id);
		if (u != null) {
			System.out.println("Trovato l'utente con id: " + id);
			System.out.println(u);
		}
		return u;
	}
	
	public Utente findByEmail(String email) {
		Utente u = dao.findByEmail(email);
		if (u != null) {
			System.out.println("Trovato l'utente con email: " + email);
			System.out.println(u);
		}
		return u;
	}
	public Utente findByName(String name) {
		Utente u = dao.findByName(name);
		if (u != null) {
			System.out.println("Trovato l'utente con name: " + name);
			System.out.println(u);
		}
		return u;
	}

	public List<Utente> findAll() {
		List<Utente> lista = dao.findAll();
		System.out.println("Ho trovato i seguenti utenti:");
		for (Utente u : lista) {
			System.out.println(u);
		}
		return lista;
	}

	public void delete(Integer id) {
		dao.deleteById(id);
		System.out.println("Eliminato l'utente con id: " + id);
	}
	
	public boolean login(String email, String password) throws UtenteException {
		
		try {
			String hashed= HashPassword(password);
			return dao.login(email, hashed);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return true;
		
	}
	
	public void updateProfileImage(int userId, String urlImmagine) {
	    Utente utente = dao.find(userId);
	    if (utente != null) {
	        utente.setImmagineProfilo(urlImmagine);
	        dao.update(utente);
	        System.out.println("Immagine profilo aggiornata per l'utente con id: " + userId);
	    } else {
	        System.out.println("Utente non trovato con id: " + userId);
	    }
	}
	
}