package test;

import com.idm.trenohibernate.*;
import com.idm.trenohibernate.TN.TNVagoneFactory;
import com.idm.trenohibernate.exceptions.TrenoException;
import com.idm.trenohibernate.exceptions.UtenteException;
import com.idm.trenohibernate.dao.*;
import com.idm.trenohibernate.utils.HibernateUtil;
import com.idm.trenohibernate.service.*;
import org.hibernate.SessionFactory;


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
//		Utente utente = u.creaUtente("Domenico", "Frau", "domenico.frau@outlook.com", "12345", "https://media.licdn.com/dms/image/D4D03AQGbzQCFYWFHtw/profile-displayphoto-shrink_800_800/0/1683228288475?e=1704931200&v=beta&t=ZnRLaqxB07zp7YsM2gpM-8mvbdPU3ezNdH_JIBb0rlI", "Italy");	
//		uService.crea(utente);
//		
//		Utente utente1 = u.creaUtente("Mario", "Rossi", "mario.rossi@gmail.com", "12345", "https://www.gamesvillage.it/wp-content/uploads/2023/04/Nintendo-Super-Mario-Run-Smartphone-9.jpg", "Italy");	
//		uService.crea(utente1);
//		
//		Utente utente2 = u.creaUtente("Luigi", "Verdi", "luigi.verdi@gmail.com", "12345", "https://static.wikia.nocookie.net/newersupermariobroswii/images/c/ca/Luigi-png.png/revision/latest?cb=20210811194106", "Italy");	
//		uService.crea(utente2);
//		
//		Utente utente3 = u.creaUtente("John", "Ruth", "jhon.ruth@gmail.com", "12345", "https://cdnb.artstation.com/p/assets/images/images/004/109/281/large/andrew-gray-john-ruth-the-hangman.jpg?1480438555", "United States");	
//		uService.crea(utente3);
		
//		Utente u1 = uService.find(57);
		
//		-----------------------------------------------------------------------------------
		
//		CANCELLAZIONE DI UN UTENTE  -------------------------------------------------------
		
//		UtenteService uService = new UtenteService();
//		uService.delete(3433);
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
		
		VagoneFactory f = new TNVagoneFactory();
		TrenoBuilder b = new ConcreteBuilder(f);
		TrenoService tService = new TrenoService();
//		tService.crea(t);
//		-----------------------------------------------------------------------------------
		
//		CANCELLAZIONE DI UN TRENO  --------------------------------------------------------

//		TrenoService tService = new TrenoService();
//		tService.delete(3445);
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
		VagoneService vService = new VagoneService();
//		Treno t =tService.find(2);
//		Treno t = tService.findByName("Romi");
//		Utente u = t.getUtente();
//		b.addVagonePasseggeri(t);
//		vService.rimuoviVagone(1331);
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
//		tSvcC.findTreni("jerry", "TreNord", "Piemonte", 0, 2000, false);
//		-----------------------------------------------------------------------------------

		if (sessionFactory != null) {
			HibernateUtil.shutdown();
		}
	}

}