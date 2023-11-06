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

		    Session session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Treno> criteriaQuery = criteriaBuilder.createQuery(Treno.class);

			Root<Treno> root = criteriaQuery.from(Treno.class);

			Predicate namePredicate = criteriaBuilder.like(criteriaBuilder.lower(root.get("nome")), "%" + name.toLowerCase() + "%");
			criteriaQuery.where(namePredicate);
			TypedQuery<Treno> query = session.createQuery(criteriaQuery);

			List<Treno> treni = query.getResultList();

			return treni;

	}

	public List<Treno> findTreno(String nome, String marca, String regione) {

			Session session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Treno> criteriaQuery = criteriaBuilder.createQuery(Treno.class);

			Root<Treno> root = criteriaQuery.from(Treno.class);

			Predicate namePredicate = criteriaBuilder.like(criteriaBuilder.lower(root.get("nome")), "%" + nome.toLowerCase() + "%");
			Predicate marcaPredicate = criteriaBuilder.equal(root.get("marca"), marca);
			Predicate regionePredicate = criteriaBuilder.equal(root.get("regione"), regione);

			Predicate finalPredicate = criteriaBuilder.and(namePredicate, marcaPredicate, regionePredicate);

			if (marca.equals("tutte")) {
				finalPredicate = namePredicate;
				System.out.println(nome + " " + marca);
			} 
			
			if (regione.equals("tutte")) {
				finalPredicate = criteriaBuilder.and(namePredicate, marcaPredicate);
				System.out.println(nome + " " + marca);
			} 

			criteriaQuery.where(finalPredicate);

			TypedQuery<Treno> query = session.createQuery(criteriaQuery);
			List<Treno> treni = query.getResultList();
			System.out.println(treni.size());
			return treni;
			
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
