package com.idm.trenohibernate.dao;


import com.idm.trenohibernate.Vagone;

public class VagoneDAOImpl extends BaseDAO<Vagone> implements VagoneDAO{

	@Override
	public Integer create(Vagone vagone) {
		return super.create(vagone);
	}

	@Override
	public void update(Vagone bean) {
		 super.update(bean);
	}

	@Override
	public void delete(Vagone vagone) {
		 Vagone wagon= (Vagone) super.find(Vagone.class, vagone.getId());
		 super.delete(wagon);
	}

	@Override
	public Vagone find(Integer id) {
		return (Vagone) super.find(Vagone.class, id);
	}

}