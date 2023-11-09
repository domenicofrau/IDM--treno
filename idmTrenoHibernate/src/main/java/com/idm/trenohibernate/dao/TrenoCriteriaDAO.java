package com.idm.trenohibernate.dao;

import java.util.ArrayList;
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

	public List<Treno> findTreno(String nome, String marca, String regione, int prezzoMin, int prezzoMax, boolean inVendita) {
		
			String allValue = "Tutte";	

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
			Predicate notInVenditaPredicate = criteriaBuilder.isFalse(root.get("inVendita"));
			
		//	Predicate finalPredicate = criteriaBuilder.and(namePredicate, marcaPredicate, regionePredicate, prezzoPredicate, inVenditaPredicate);
			List<Predicate> predicates = new ArrayList<Predicate>();
			predicates.add(namePredicate);
			predicates.add(prezzoPredicate);
			
			if (!allValue.equals(marca)){				
				predicates.add(marcaPredicate);;
			} 	
			if (!allValue.equals(regione)) {
				predicates.add(regionePredicate);
			} 		
			if (inVendita) {
				predicates.add(inVenditaPredicate);
			} 
			if (!inVendita) {
				predicates.add(notInVenditaPredicate);
			} 
	//		criteriaQuery.where(finalPredicate);

			TypedQuery<Treno> query = session.createQuery(criteriaQuery);
	//		List<Treno> treni = query.getResultList();
			criteriaQuery.select(root)
            .where(predicates.toArray(new Predicate[]{}));

			List<Treno> treni = session.createQuery(criteriaQuery).getResultList();
			System.out.println(treni.size());
			return treni;
			} catch (Exception e) {
		        tx.rollback();
		        throw e;
		    } finally {
		        tx.commit();
		    }
			
	}

}
