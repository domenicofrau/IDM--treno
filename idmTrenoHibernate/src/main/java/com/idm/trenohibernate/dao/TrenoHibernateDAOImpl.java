package com.idm.trenohibernate.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.idm.trenohibernate.Treno;

public class TrenoHibernateDAOImpl extends BaseDAO implements TrenoHibernateDAO {

	public Integer create(Treno bean) {
		return super.create(bean);
	}

//	public void update(Treno bean) {
//		super.update(bean);
//	}
//
//	public void delete(Treno bean) {
//		// bean.setValidity(false);
//		super.update(bean);
//	}

}
