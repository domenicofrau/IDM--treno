package com.idm.trenohibernate.service;

import java.util.List;
import org.springframework.stereotype.Component;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.dao.*;

@Component
public class UtenteService {

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

}