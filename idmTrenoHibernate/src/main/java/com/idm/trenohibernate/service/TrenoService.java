package com.idm.trenohibernate.service;

import java.util.List;

import org.springframework.stereotype.Component;
import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.dao.*;
import com.idm.trenohibernate.exceptions.SaldoNonSufficenteException;


@Component
public class TrenoService {

	public TrenoService() {
		super();
	}

	private TrenoHibernateDAO dao = new TrenoHibernateDAOImpl();

	public void crea(Treno treno) {
		Integer id = dao.create(treno);
		Utente utente = treno.getUtente();
		if (utente != null) {
			System.out.println("Creato il treno con id: " + id + " assegnato all'utente " + utente.getId());
		} else {
			System.out.println("Creato il treno con id: " + id + ", ma non è stato assegnato nessun utente.");
		}
	}

	public void update(Treno treno) {
		dao.update(treno);
		System.out.println("modificato il treno con id: " + treno.getId());
	}

	public Treno find(Integer id) {
		Treno t = dao.find(id);
		if (t != null) {
			System.out.println("Trovato il treno con id: " + id);
			System.out.println(t);
		}
		return t;
	}

	public Treno findByName(String nome) {
		Treno t = dao.findByNome(nome);
		if (t != null) {
			System.out.println("Trovato il treno con nome: " + nome);
			System.out.println(t);
		}
		return t;
	}
	
	public List<Treno> findAll() {
		List<Treno> lista = dao.findAll();
		System.out.println("Ho trovato i seguenti treni:");
		for (Treno t : lista) {
			System.out.println(t);

		}
		return lista;
	}

	public void delete(int id) {
		dao.deleteById(id);
		System.out.println("Eliminato il treno con id: " + id);
	}
	
    public List<Treno> findByUtenteId(Integer utenteId) {
        return dao.findByUtenteId(utenteId);
    }
    
    public List<Treno> lunghezzaTrenoByIdUtente(Integer utenteId) {
        return dao.findByUtenteId(utenteId);
    }

    public void vendiTreno(Treno treno, Utente venditore, Utente compratore) throws SaldoNonSufficenteException {
    	dao.vendiTreno(treno, venditore, compratore);
    }
}
