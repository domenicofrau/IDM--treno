package test;

import com.idm.trenohibernate.*;
import com.idm.trenohibernate.TN.TNVagoneFactory;
import com.idm.trenohibernate.exceptions.TrenoException;
import com.idm.trenohibernate.exceptions.UtenteException;
import com.idm.trenohibernate.utils.HibernateUtil;
import com.idm.trenohibernate.service.*;
import org.hibernate.SessionFactory;


public class Main {
    public static void main(String[] args)
            throws TrenoException, UtenteException {

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        System.out.println("run.....");

		VagoneFactory f = new TNVagoneFactory();
		TrenoBuilder b = new ConcreteBuilder(f);
		TrenoService tService = new TrenoService();
		
		UtenteBuilder u = new UtenteBuilder();
		UtenteService uService = new UtenteService();
//		Utente utenteTrovato1 = uService.findByEmail("sonogianni@daje.com");
		Utente utenteTrovato2 = uService.findByEmail("ilCollezionista@nonlascionulla.com");
		String immagine="https://mantovauno.it/wp-content/uploads/2020/07/ETR_500_Frecciarossa_at_platform_in_Milano_Centrale-e1520333682748.jpg";
//		Treno t =tService.find(2);
		
		
//		Treno t = b.costruisciTreno(sigla, nomeTreno, immagine);
//		Utente utente = u.creaUtente("Compratore", "Collezionista", "ilCollezionista@nonlascionulla.com", "password123");	
		

//		uService.crea(utente);
//		t.setUtente(t, utenteTrovato);
		
//		Treno t =tService.findByName("B");
//		t.vendiTreno(t, utenteTrovato1, utenteTrovato2);
//		t.setUtente(t, utenteTrovato2);
//		tService.crea(t);
//		tService.update(t);
//		uService.update(utenteTrovato1);
//		uService.update(utenteTrovato2);
		
//		*************************************** RICERCA TRENI **********************************
		
		Treno t1 = tService.findByName(nomeTreno);
		
		if (sessionFactory != null) {
			HibernateUtil.shutdown();
		}
	}
}