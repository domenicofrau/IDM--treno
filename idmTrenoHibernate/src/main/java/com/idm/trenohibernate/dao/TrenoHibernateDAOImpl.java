package com.idm.trenohibernate.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Query;
import org.hibernate.Session;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.utils.HibernateUtil;

public class TrenoHibernateDAOImpl extends BaseDAO<Treno> implements TrenoHibernateDAO {
	

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
		return super.findAll(Treno.class);
	}

	@Override
	public Treno findByNome(String nome) {
		return  (Treno) super.findByName(Treno.class,nome);
	}
	
    @Override
    public List<Treno> findByUtenteId(Integer utenteId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<Treno> query = session.createQuery("FROM Treno WHERE utente.id = :utenteId", Treno.class);
        query.setParameter("utenteId", utenteId);
        List<Treno> treni = query.getResultList();
        session.close();
        return treni;
    }

    
    
}