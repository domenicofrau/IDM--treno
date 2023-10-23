package com.idm.trenohibernate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.idm.trenohibernate.Treno;
import com.idm.trenohibernate.dao.*;

@Service
public class TrenoService {

private TrenoHibernateDAO dao = new TrenoHibernateDAOImpl(); 
	
	public void crea (Treno treno) {
		Integer id = dao.create(treno); 
		System.out.println("Creato il treno con id: " + id);
	} 
	
	public void update (Treno treno) {
		dao.update(treno); 
		System.out.println("modificato l'impiegato con id: " + treno.getId());
	} 	
//	
//	public void aumentaSalario (Employee employee) {
//		
//		int salary = (int) (employee.getSalary()*1.1 + 0.5) ; 
//		employee.setSalary(salary);
//		dao.update(employee); 
//		
//		System.out.println("modificato l'impiegato con id: " + employee.getId());
//	}

	public Treno find(Integer id) {
		Treno t = dao.find(id)
;
		if(t != null) {
			System.out.println("Trovato il treno con id: " + id);
			System.out.println(t);			
		}
		return t;
	} 
	

	public List<Treno> findAll() {
		List<Treno> lista = dao.findAll();
		System.out.println("Ho trovato i seguenti treni:");
		for ( Treno t : lista) {
			System.out.println(t);
			
		}
		return lista;
	} 
	
	
	public void delete (Integer id) {
		dao.deleteById(id)
;
		System.out.println("Eliminato il treno con id: " + id);
	}
}
