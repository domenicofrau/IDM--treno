package com.idm.trenohibernate.dao;

import java.util.List;

import com.idm.trenohibernate.Treno;

public interface TrenoHibernateDAO {
	public Integer create(Treno bean);
	   public void update(Treno bean );
//	   public void delete(Treno bean );
	   public void deleteById(Integer id);
	public Treno find(Integer id);
//	public List<Treno> findByName(String name);
	public List<Treno> findAll();

}
