package test;

import com.idm.trenohibernate.*;
import com.idm.trenohibernate.TN.TNVagoneFactory;
import com.idm.trenohibernate.exceptions.TrenoException;
import com.idm.trenohibernate.exceptions.UtenteException;
import com.idm.trenohibernate.utils.HibernateUtil;
import com.idm.trenohibernate.service.*;
import org.hibernate.SessionFactory;
//import java.security.MessageDigest;
//import java.security.NoSuchAlgorithmException;

public class Main {
//	private static String HashPassword(String password) throws NoSuchAlgorithmException {
//        MessageDigest md = MessageDigest.getInstance("SHA-256");
//        byte[] hashBytes = md.digest(password.getBytes());
//        StringBuilder sb = new StringBuilder();
//        for (byte b : hashBytes) {
//            sb.append(String.format("%02x", b));
//        }
//        return sb.toString();
//    }
	public static void main(String[] args) throws TrenoException, UtenteException {
//		String stringa="ciao";
//		String check="ciao";
//		try {
//			System.out.println(HashPassword(stringa));
//			System.out.println(HashPassword(check));
//		} catch (NoSuchAlgorithmException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		System.out.println("run.....");

		VagoneFactory f = new TNVagoneFactory();
//		TrenoBuilder b = new ConcreteBuilder(f);
		TrenoService tService = new TrenoService();

		UtenteBuilder u = new UtenteBuilder();
		UtenteService uService = new UtenteService();
//		Utente utenteTrovato1 = uService.findByEmail("sonogianni@daje.com");
//		Utente utenteTrovato2 = uService.findByEmail("ilCollezionista@nonlascionulla.com");
//		String immagine = "https://mantovauno.it/wp-content/uploads/2020/07/ETR_500_Frecciarossa_at_platform_in_Milano_Centrale-e1520333682748.jpg";
//		Treno t =tService.find(2);

		
//		tService.delete(2356);

//		Treno t = b.costruisciTreno("HPPPPRPPPP", "ciaoaaa", "OK", "sardegna");
		Utente utente = u.creaUtente("Compratore", "Collezionista", "ciao", "password123", "https://tse1.mm.bing.net/th?id=OIP.4qz9OQ4Gwl5IPXwIzAa6pAHaEK&pid=Api&P=0&h=180");	
//		uService.crea(utente);
//		Treno t =tService.findByName("carlo");
//		uService.crea(utente);
//		t.setUtente(t, utenteTrovato1);
//		uService.update(utenteTrovato1);
//		tService.update(t);
//		String email="pastella@ciaociao.com";
//		String password="password123";
//		System.out.println(uService.login(email,password ));

//		t.vendiTreno(t, utenteTrovato1, utenteTrovato2);
//		t.setUtente(t, utenteTrovato2);
//		tService.crea(t);
//		tService.update(t);
//		uService.update(utenteTrovato1);
//		uService.update(utenteTrovato2);
		
//		***************************** CRITERIA BUILDER  *****************************
		
		TrenoServiceCriteria tSvcC = new TrenoServiceCriteria();
//		tSvcC.findByNameLike("tre");
//		tSvcC.findTreni("Tommy", "TreNord");
//		tSvcC.findTreniPrezzo(510, 510);
		tSvcC.findTreni("tommy", "TreNord", "Umbria", 0, 2000);
		if (sessionFactory != null) {
			HibernateUtil.shutdown();
		}
	}

}