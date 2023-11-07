package test;

import com.idm.trenohibernate.*;
import com.idm.trenohibernate.TN.TNVagoneFactory;
import com.idm.trenohibernate.exceptions.TrenoException;
import com.idm.trenohibernate.exceptions.UtenteException;
import com.idm.trenohibernate.dao.*;
import com.idm.trenohibernate.utils.HibernateUtil;
import com.idm.trenohibernate.service.*;
import org.hibernate.SessionFactory;
//import java.security.MessageDigest;
//import java.security.NoSuchAlgorithmException;

public class Main {
	public static void main(String[] args) throws TrenoException, UtenteException {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		System.out.println("running....................................");

//		C R E A Z I O N E   D I   U N   U T E N T E   E   P E R S I S T E N Z A -----------------------------------
		
//		UtenteBuilder u = new UtenteBuilder();
//		UtenteService uService = new UtenteService();
//		Utente utente = u.creaUtente("Domenico", "Frau", "domenico.frau@outlook.com", "12345", "https://image.api.playstation.com/vulcan/img/rnd/202010/2621/H9v5o8vP6RKkQtR77LIGrGDE.png", "Italy");	
//		uService.crea(utente);

		
//		C A N C E L L A Z I O N E   D I   U N   U T E N T E  ------------------------------------------------------
		
//		UtenteService uService = new UtenteService();
//		uService.delete(0000);
		
		
//		R I C E R C A   D I   U N   U T E N T E  P E R  M A I L  --------------------------------------------------
		
//		UtenteService uService = new UtenteService();
//		Utente u = uService.findByEmail("domenico.frau@outlook.com");
		
		
//		C R E A Z I O N E   D I   U N   T R E N O   E   P E R S I S T E N Z A -------------------------------------
		
//		VagoneFactory f = new TNVagoneFactory();
//		TrenoBuilder b = new ConcreteBuilder(f);
//		TrenoService tService = new TrenoService();
//		tService.crea(t);
		
		
//		C A N C E L L A Z I O N E   D I   U N   T R E N O  --------------------------------------------------------
//		TrenoService tService = new TrenoService();
//		tService.delete(0000);

		
		
		
		
		
		
		
		

//		Treno t =tService.find(2);
		
//		Treno t = tService.findByName("qweasdadw");
//		Utente u = t.getUtente();
//		b.addVagonePasseggeriBusiness(t);
//		va.rimuoviVagone(1018);
//		tService.find(1017);

//		Treno t = b.costruisciTreno("HPPPPRPPPP", "ciaoaaa", "OK", "sardegna");
		//		uService.find(utente);
//		Treno t =tService.findByName("carlo");
		
//		t.setUtente(t, utenteTrovato1);
//		uService.update(utenteTrovato1);
//		tService.update(t);
//		String email="pastella@ciaociao.com";
//		String password="password123";
//		System.out.println(uService.login(email,password ));

//		t.vendiTreno(t, utenteTrovato1, utenteTrovato2);
//		t.setUtente(t, utenteTrovato2);
//		tService.update(t);
//		uService.update(utenteTrovato1);
//		uService.update(utenteTrovato2);
		
//		***************************** CRITERIA BUILDER  *****************************
		
//		TrenoServiceCriteria tSvcC = new TrenoServiceCriteria();
//		tSvcC.findByNameLike("tre");
//		tSvcC.findTreni("Tommy", "TreNord");
//		tSvcC.findTreniPrezzo(510, 510);
//		tSvcC.findTreni("tommy", "TreNord", "Umbria", 0, 2000);
		if (sessionFactory != null) {
			HibernateUtil.shutdown();
		}
	}

}