package com.idm.trenohibernate.dao;

import java.util.List;

import com.idm.trenohibernate.Treno;

public class TrenoHibernateDAOImpl extends BaseDAO implements TrenoHibernateDAO {

	public Integer create(Treno bean) {
		return super.create(bean);
	}

	public void update(Treno bean) {
		super.update(bean);
	}

	public Treno find(Integer id) {
		Treno treno = (Treno) find(Treno.class, id);
		return treno;
	}

	public void deleteById(Integer id) {
		Treno treno = (Treno) find(Treno.class, id);
		if (treno != null) {
			delete(treno);
		} else {
			System.out.println("Il treno con l'ID " + id + " non è stato trovato.");
		}
	}

	public List<Treno> findAll() {
		return super.findAll();
	}

}
