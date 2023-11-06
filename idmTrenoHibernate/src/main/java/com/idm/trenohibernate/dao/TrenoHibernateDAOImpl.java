package com.idm.trenohibernate.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Query;
import org.hibernate.Session;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.Vagone;
import com.idm.trenohibernate.exceptions.SaldoNonSufficenteException;
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
    

    @Override
	public void vendiTreno(Treno treno, Utente venditore, Utente compratore) throws SaldoNonSufficenteException {
		List<Vagone> listaVagoni = treno.getVagoni();
		int prezzoTreno = 0;
		for (Vagone vagone : listaVagoni) {
			prezzoTreno += vagone.getPrezzo();
		}
		if (compratore.getbitTrain() - prezzoTreno < 0) {
			throw new SaldoNonSufficenteException("Saldo non ufficente, il  tuo saldo è: " + compratore.getbitTrain()
					+ ", sono necessari: " + prezzoTreno);

		}
		
		treno.setInVendita(false);
		compratore.setbitTrain(compratore.getbitTrain() - prezzoTreno);
		venditore.setbitTrain(venditore.getbitTrain() + prezzoTreno);
		treno.setUtente(compratore);
		super.update(treno);
	}
}