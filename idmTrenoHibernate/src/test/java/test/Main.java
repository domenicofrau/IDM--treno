package test;

import com.idm.trenohibernate.*;
import com.idm.trenohibernate.TN.TNVagoneFactory;
import com.idm.trenohibernate.exceptions.TrenoException;
import com.idm.trenohibernate.utils.HibernateUtil;
import com.idm.trenohibernate.service.*;
import org.hibernate.SessionFactory;


public class Main {
	public static void main(String[] args)
			throws TrenoException{
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		System.out.println("run.....");

		String sigla = "Hppppppppprpppppph";
		sigla = sigla.toUpperCase();
		String nomeTreno = "Pippo";

		VagoneFactory f = new TNVagoneFactory();
		TrenoBuilder b = new ConcreteBuilder(f);
		Treno t = b.costruisciTreno(sigla,"Treno1");

		UtenteBuilder u = new UtenteBuilder();
	//	Utente utente = u.creaUtente("Mario", "Rossi", "mario.rossi@email.com", "password123");

	//	t.setUtente(utente);

//		UtenteService us = new UtenteService();
//		Utente utenteTrovato = us.find(1561);
//		t.setUtente(utenteTrovato);

		TrenoService tService = new TrenoService();
//		tService.crea(t);
//		tService.findAll();
//		tService.delete(113);
		tService.find(1);

//		UtenteService uService = new UtenteService();
//		uService.crea(utente);
//		uService.findAll();
//		uService.delete();
//		uService.find();

		if (sessionFactory != null) {
			HibernateUtil.shutdown();
		}
	}
}