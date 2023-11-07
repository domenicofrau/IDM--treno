package com.idm.trenohibernate.dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public abstract class BaseDAO<T> {
	
	protected static SessionFactory factory;

	static {
		try {
			factory = new Configuration().configure().buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Failed to create sessionFactory object." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	protected Integer create(T bean) {
		Session session = factory.openSession();
		Transaction tx = null;
		Integer ID = null;

		try {
			tx = session.beginTransaction();
			ID = (Integer) session.save(bean);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return ID;
	}

	protected void update(T bean) {
		Session session = factory.openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.update(bean);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.evict(bean); 
			session.close();
		}
	}

	protected void delete(T obj) {
		Session session = factory.openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.delete(obj); // corrected line
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	protected void deleteById(T object) {
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

	protected Bean find(Class<?> classe, Integer id) {
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
	protected Bean findByEmail(Class<?> clazz, String email) {
	    Session session = factory.openSession();
	    Transaction tx = null;
	    Bean bean = null;

	    try {
	        tx = session.beginTransaction();
	        String hql = "from " + clazz.getName() + " where email = :email";
	        Query<?> query = session.createQuery(hql);
	        query.setParameter("email", email);
	        bean = (Bean) query.uniqueResult();
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
	protected Bean findByName(Class<?> clazz, String nome) {
	    Session session = factory.openSession();
	    Transaction tx = null;
	    Bean bean = null;

	    try {
	        tx = session.beginTransaction();
	        String hql = "from " + clazz.getName() + " where nome = :nome";
	        Query<?> query = session.createQuery(hql);
	        query.setParameter("nome", nome);
	        bean = (Bean) query.uniqueResult();
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
	
	public List<T> findAll(Class<T> clazz) {
		Session session = factory.openSession();
		Transaction tx = null;
		List<T> list = null;
		try {
			tx = session.beginTransaction();
			String hql = "from " + clazz.getName();
			Query<T> query = session.createQuery(hql, clazz);
			list = query.list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

}
