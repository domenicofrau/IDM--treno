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

	public List<Treno> findTreno(String nome, String marca, String regione, int prezzoMin, int prezzoMax, boolean isInVendita) {
		
			String allValue = "tutte";
			if(prezzoMin < 0) {
				prezzoMin = 0;
			} else if(prezzoMin > 3000) {
				prezzoMin = 3000;
			}
			if(prezzoMax < 0) {
				prezzoMax = 0;
			} else if(prezzoMax > 3000) {
				prezzoMax = 3000;
			}
			
			if(nome == null) {
				nome = "";
			}

			Session session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();
			
			try {
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Treno> criteriaQuery = criteriaBuilder.createQuery(Treno.class);

			Root<Treno> root = criteriaQuery.from(Treno.class);

			Predicate namePredicate = criteriaBuilder.like(criteriaBuilder.lower(root.get("nome")), "%" + nome.toLowerCase() + "%");
			Predicate marcaPredicate = criteriaBuilder.equal(root.get("marca"), marca);
			Predicate regionePredicate = criteriaBuilder.equal(root.get("regione"), regione);
			Predicate prezzoPredicate = criteriaBuilder.between(root.get("prezzoTotale"), prezzoMin, prezzoMax);
			Predicate inVenditaPredicate = criteriaBuilder.isTrue(root.get("inVendita"));
			
			Predicate finalPredicate = criteriaBuilder.and(namePredicate, marcaPredicate, regionePredicate, prezzoPredicate);

			if (marca.equals(allValue)) {
				finalPredicate = criteriaBuilder.and(namePredicate, regionePredicate, prezzoPredicate);
				System.out.println(nome + " " + marca);
			} 	
			if (regione.equals(allValue)) {
				finalPredicate = criteriaBuilder.and(namePredicate, marcaPredicate, prezzoPredicate);
				System.out.println(nome + " " + marca);
			} 
			if (regione.equals(allValue) && marca.equals(allValue)) {
				finalPredicate = criteriaBuilder.and(namePredicate, prezzoPredicate);
				System.out.println(nome + " " + marca);
			} 
			if (isInVendita == false) {
				finalPredicate = criteriaBuilder.and(namePredicate, marcaPredicate, regionePredicate, prezzoPredicate);
				System.out.println(nome + " " + marca);
			} 
			System.out.println(nome + " " + marca + " " + regione + " " + prezzoMin + " " + prezzoMax + " " + isInVendita);
			criteriaQuery.where(finalPredicate);

			TypedQuery<Treno> query = session.createQuery(criteriaQuery);
			List<Treno> treni = query.getResultList();
			System.out.println(treni.size());
			return treni;
			} catch (Exception e) {
		        tx.rollback();
		        throw e;
		    } finally {
		        tx.commit();
		    }
			
	}

		public List<Treno> findByPrezzo(int prezzoMin, int prezzoMax){
		
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
	
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Treno> criteriaQuery = criteriaBuilder.createQuery(Treno.class);
		
		Root<Treno> root = criteriaQuery.from(Treno.class);
		
		Predicate prezzoPredicate = criteriaBuilder.between(root.get("prezzoTotale"), prezzoMin, prezzoMax);
		criteriaQuery.where(prezzoPredicate);
		TypedQuery<Treno> query = session.createQuery(criteriaQuery);
		
		List<Treno> treni = query.getResultList();
		
		session.close();
		
		return treni;
	}

}
