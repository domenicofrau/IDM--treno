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

	public void update(Treno bean) {
		super.update(bean);
	}

//	public void delete(Treno bean) {
//		// bean.setValidity(false);
//		super.delete(bean);
//	}
	
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
		// TODO Auto-generated method stub
		return super.findAll();
	}
	
	
}
