package com.idm.trenohibernate.dao;

import java.util.List;
import com.idm.trenohibernate.Utente;

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
}
