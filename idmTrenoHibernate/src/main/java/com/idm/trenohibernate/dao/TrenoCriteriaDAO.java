package com.idm.trenohibernate.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.utils.HibernateUtil;

@Repository
public class TrenoCriteriaDAO {

	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	public List<Treno> findByNameLike(String name) {

		try (Session session = sessionFactory.getCurrentSession()) {
			Transaction tx = session.beginTransaction();

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Treno> criteriaQuery = criteriaBuilder.createQuery(Treno.class);

			Root<Treno> root = criteriaQuery.from(Treno.class);

			Predicate namePredicate = criteriaBuilder.like(root.get(("nome").toLowerCase()),
					"%" + name.toLowerCase() + "%");
			criteriaQuery.where(namePredicate);
			TypedQuery<Treno> query = session.createQuery(criteriaQuery);

			List<Treno> treni = query.getResultList();

			return treni;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public List<Treno> findTreno(String nome, String marca) {

		try (Session session = sessionFactory.getCurrentSession()) {
			Transaction tx = session.beginTransaction();

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Treno> criteriaQuery = criteriaBuilder.createQuery(Treno.class);

			Root<Treno> root = criteriaQuery.from(Treno.class);

			Predicate namePredicate = criteriaBuilder.like(root.get(("nome").toLowerCase()),
					"%" + nome.toLowerCase() + "%");
			Predicate marcaPredicate = criteriaBuilder.equal(root.get("marca"), marca);

			Predicate finalPredicate;

			if (nome != null && marca != null) {
				finalPredicate = criteriaBuilder.and(namePredicate, marcaPredicate);
			} else {
				finalPredicate = criteriaBuilder.or(namePredicate, marcaPredicate);
			}

			criteriaQuery.where(finalPredicate);

			TypedQuery<Treno> query = session.createQuery(criteriaQuery);
			List<Treno> result = query.getResultList();

			if (result.isEmpty()) {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

//		public List<Treno> findByMarca(String marca){
//		
//		Session session = sessionFactory.getCurrentSession();
//		Transaction tx = session.beginTransaction();
//	
//		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
//		CriteriaQuery<Treno> criteriaQuery = criteriaBuilde)r.createQuery(Treno.class);
//		
//		Root<Treno> root = criteriaQuery.from(Treno.class);
//		
//		Predicate namePredicate = criteriaBuilder.like(root.get(("nome")), "%" + marca + "%");
//		criteriaQuery.where(namePredicate);
//		TypedQuery<Treno> query = session.createQuery(criteriaQuery);
//		
//		List<Treno> treni = query.getResultList();
//		
//		session.close();
//		
//		return treni;
//	}

}
