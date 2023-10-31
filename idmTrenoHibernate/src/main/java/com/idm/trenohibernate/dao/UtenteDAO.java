package com.idm.trenohibernate.dao;

import java.util.List;

import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.exceptions.UtenteException;

public interface UtenteDAO {
	public Integer create(Utente bean);

	public void update(Utente bean);

	public void deleteById(Integer id);

	public Utente find(Integer id);
	
	public Utente findByEmail(String email);
	
	public Utente findByName(String name);

	public List<Utente> findAll();

	Boolean login(String email, String password) throws UtenteException;
			 
}