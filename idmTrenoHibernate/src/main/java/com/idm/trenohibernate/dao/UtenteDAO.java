package com.idm.trenohibernate.dao;

import java.util.List;

import com.idm.trenohibernate.Utente;

public interface UtenteDAO {
	public Integer create(Utente bean);

	public void update(Utente bean);

	public void deleteById(Integer id);

	public Utente find(Integer id);

	public List<Utente> findAll();

}