package com.idm.trenohibernate.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.idm.trenohibernate.Treno;

public abstract class BaseDAO {
	protected static SessionFactory factory;

	static {
		try {
			factory = new Configuration().configure().buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Failed to create sessionFactory object." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	protected Integer create(Bean bean) {
		Session session = factory.openSession();
		Transaction tx = null;
		Integer employeeID = null;

		try {
			tx = session.beginTransaction();

			employeeID = (Integer) session.save(bean);

			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return employeeID;
	}

	/* Method to UPDATE salary for an employee */
	protected void update(Bean bean) {
		Session session = factory.openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.update(bean);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	protected void delete(Bean bean) {
		Session session = factory.openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.delete(bean);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
//	  protected void deleteById(Integer id){
//	      Session session = factory.openSession();
//	      Transaction tx = null;   
//	      try {
//	    	 Bean b = session.get(com.idm.trenohibernate.Treno.class, id);
//	         tx = session.beginTransaction();
//	         session.delete(b); 
//	         tx.commit();
//	      } catch (HibernateException e) {
//	         if (tx!=null) tx.rollback();
//	         e.printStackTrace(); 
//	      } finally {
//	         session.close(); 
//	      }
//	   }
	    protected void deleteById(Object object) {
	        Session session = factory.openSession();
	        Transaction tx = null;

	        try {
	        	
	            tx = session.beginTransaction();
	            session.delete(object);
	            tx.commit();
	        } catch (HibernateException e) {
	            if (tx != null)
	                tx.rollback();
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	    }

	protected Bean find(Class classe, Integer id) {
		Session session = factory.openSession();
		Transaction tx = null;
		Bean bean = null;

		try {
			tx = session.beginTransaction();

			bean = (Bean) session.get(classe, id);

			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return bean;
	}
	public List<Treno> findAll() {
         Session session = factory.openSession();
	      Transaction tx = null;
	      List<Treno> trenoList = null; 
	      try {
	         tx = session.beginTransaction();
	         String hql = "from " + com.idm.trenohibernate.Treno.class.getName();
	         Query<Treno> query = (Query<Treno>) session.createQuery(hql);
  
	         trenoList = query.list();
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	      return trenoList;
	   } 
}
