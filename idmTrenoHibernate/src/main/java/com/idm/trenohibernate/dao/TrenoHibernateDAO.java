package com.idm.trenohibernate.dao;

import java.util.List;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Utente;

public interface TrenoHibernateDAO {
	public Integer create(Treno bean);

	public void update(Treno bean);

	public void deleteById(Integer id);
	
	public Treno findByNome(String nome);
	public Treno find(Integer id);

	public List<Treno> findAll();
	public List<Treno> findByUtenteId(Integer utenteId);

//	public void delete(Treno bean );
//	public List<Treno> findByName(String name);

}
