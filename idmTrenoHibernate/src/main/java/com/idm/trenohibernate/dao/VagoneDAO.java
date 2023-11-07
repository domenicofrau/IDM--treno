package com.idm.trenohibernate.dao;


import com.idm.trenohibernate.Vagone;

public interface VagoneDAO{
	public Integer create(Vagone bean);
	public void update(Vagone bean);
	public void deleteById(int id);
	public Vagone find(Integer id);
}