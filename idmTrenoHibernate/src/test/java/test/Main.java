package test;

import com.idm.trenohibernate.*;
import com.idm.trenohibernate.TN.TNVagoneFactory;
import com.idm.trenohibernate.exceptions.LocomotivaException;
import com.idm.trenohibernate.exceptions.RistoranteException;
import com.idm.trenohibernate.exceptions.VagoniIncompatibiliException;
import com.idm.trenohibernate.service.*;
import com.idm.trenohibernate.utils.HibernateUtil;
import org.hibernate.SessionFactory;

public class Main {
	public static void main(String[] args)
			throws LocomotivaException, VagoniIncompatibiliException, RistoranteException {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		System.out.println("run.....");

		String sigla = "HpppppbrbbbpppH";
		sigla = sigla.toUpperCase();

		VagoneFactory f = new TNVagoneFactory();
		TrenoBuilder b = new ConcreteBuilder(f);
		Treno t = b.costruisciTreno(sigla);

		UtenteBuilder u = new UtenteBuilder();
		Utente utente = u.creaUtente("Mario", "Rossi", "mario.rossi@email.com", "password123");

		t.setUtente(utente);
		utente.setTreno(t);

		TrenoService tService = new TrenoService();
		tService.crea(t);
//		tService.findAll();
//		tService.delete(113);
//		tService.find(214);

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