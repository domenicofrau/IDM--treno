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
		
// 		       _             _       
// 		      | |           | |      
// 		 _   _| |_ ___ _ __ | |_ ___ 
// 		| | | | __/ _ \ '_ \| __/ _ \
// 		| |_| | ||  __/ | | | ||  __/
// 		 \__,_|\__\___|_| |_|\__\___|

		
//		CREAZIONE DI UN UTENTE E PERSISTENZA  ---------------------------------------------
		
//		UtenteBuilder u = new UtenteBuilder();
//		UtenteService uService = new UtenteService();
//		Utente utente = u.creaUtente("Domenico", "Frau", "domenico.frau@outlook.com", "12345", "https://image.api.playstation.com/vulcan/img/rnd/202010/2621/H9v5o8vP6RKkQtR77LIGrGDE.png", "Italy");	
//		uService.crea(utente);
//		-----------------------------------------------------------------------------------
		
//		CANCELLAZIONE DI UN UTENTE  -------------------------------------------------------
		
//		UtenteService uService = new UtenteService();
//		uService.delete(3220);
//		-----------------------------------------------------------------------------------
		
//		RICERCA DI UN UTENTE PER MAIL  ----------------------------------------------------
		
//		UtenteService uService = new UtenteService();
//		Utente u = uService.findByEmail("domenico.frau@outlook.com");
//		-----------------------------------------------------------------------------------
		
//		 _                        
//		| |                       
//		| |_ _ __ ___ _ __   ___  
//		| __| '__/ _ \ '_ \ / _ \ 
//		| |_| | |  __/ | | | (_) |
//		 \__|_|  \___|_| |_|\___/ 
		
		
//		CREAZIONE DI UN TRENO E PERSISTENZA  ----------------------------------------------
		
//		VagoneFactory f = new TNVagoneFactory();
//		TrenoBuilder b = new ConcreteBuilder(f);
//		TrenoService tService = new TrenoService();
//		tService.crea(t);
//		-----------------------------------------------------------------------------------
		
//		CANCELLAZIONE DI UN TRENO  --------------------------------------------------------

//		TrenoService tService = new TrenoService();
//		tService.delete(0000);
//		-----------------------------------------------------------------------------------
		
//		RICERCA DI UN TRENO PER NOME  -----------------------------------------------------

//		TrenoService tService = new TrenoService();
//		Treno t = tService.findByName("nome_treno");
//		-----------------------------------------------------------------------------------
		
//		RICERCA DI UN TRENO PER ID  -------------------------------------------------------

//		TrenoService tService = new TrenoService();
//		tService.find(0000);
//		-----------------------------------------------------------------------------------
		
//		 __   ____ _  __ _  ___  _ __   ___ 
//		 \ \ / / _` |/ _` |/ _ \| '_ \ / _ \
//		  \ V / (_| | (_| | (_) | | | |  __/
//		   \_/ \__,_|\__, |\___/|_| |_|\___|
//		              __/ |                 
//		             |___/   
		
		
//		XXXXXXXXXXXXXXXXXXXXXXXXXXX  ------------------------------------------------------
		
//		Treno t =tService.find(2);
//		Treno t = tService.findByName("qweasdadw");
//		Utente u = t.getUtente();
//		b.addVagonePasseggeriBusiness(t);
//		va.rimuoviVagone(1018);
//		uService.find(utente);
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
		
//		-----------------------------------------------------------------------------------
		
//	 	          _ _            _       
//	 	         (_) |          (_)      
// 		 ___ _ __ _| |_ ___ _ __ _  __ _ 
//	 	/ __| '__| | __/ _ \ '__| |/ _` |
// 	   | (__| |  | | ||  __/ |  | | (_| |
// 		\___|_|  |_|\__\___|_|  |_|\__,_|
		
		
//		RICERCA   -------------------------------------------------------------------------
		
//		TrenoServiceCriteria tSvcC = new TrenoServiceCriteria();
//		tSvcC.findByNameLike("tre");
//		tSvcC.findTreni("Tommy", "TreNord");
//		tSvcC.findTreniPrezzo(510, 510);
//		tSvcC.findTreni("tommy", "TreNord", "Umbria", 0, 2000);
//		-----------------------------------------------------------------------------------

		if (sessionFactory != null) {
			HibernateUtil.shutdown();
		}
	}

}