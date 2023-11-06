package com.idm.trenohibernate.dao;

import java.util.List;

import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.Vagone;

public interface VagoneDAO{
	public Integer create(Vagone vagone);
	public void update(Vagone bean);
	public void delete(Vagone vagone);
	public Vagone find(Integer id);
}