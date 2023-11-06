package com.idm.trenohibernate.dao;

import java.util.List;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.Utente;
import com.idm.trenohibernate.Vagone;
import com.idm.trenohibernate.exceptions.EmailErrataException;
import com.idm.trenohibernate.exceptions.PasswordErrataException;
import com.idm.trenohibernate.exceptions.SaldoNonSufficenteException;
import com.idm.trenohibernate.exceptions.UtenteException;

public class UtenteDAOImpl extends BaseDAO<Utente> implements UtenteDAO {

    @Override
    public Integer create(Utente bean) {
        return super.create(bean);
    }

    @Override
    public void update(Utente bean) {
        super.update(bean);
    }

    @Override
    public Utente find(Integer id) {
        return (Utente) super.find(Utente.class, id);
    }
    @Override
    public Utente findByEmail(String email) {
        return (Utente) super.findByEmail(Utente.class, email);
    }

    @Override
    public void deleteById(Integer id) {
        Utente utente = (Utente) super.find(Utente.class, id);
        if (utente != null) {
            super.delete(utente);
        } else {
            System.out.println("L'utente con ID " + id + " non è stato trovato.");
        }
    }

    @Override
    public List<Utente> findAll() {
        return super.findAll(Utente.class);
    }

	@Override
	public Utente findByName(String name) {
		return (Utente) super.findByName(Utente.class, name);
	}
	@Override
	public Boolean login(String email, String password)throws UtenteException {
		if(super.findByEmail(Utente.class, email)!=null) {
			Utente utente = (Utente) super.findByEmail(Utente.class, email);
			System.out.println(utente.getEmail()) ;
			System.out.println(utente.getPassword());
			System.out.println(email+password);
			if(utente.getPassword().equals(password)) {
				return true;
			}else throw new PasswordErrataException("Password Errata!!");
		}throw new EmailErrataException("Email errata!!");
	}

}
