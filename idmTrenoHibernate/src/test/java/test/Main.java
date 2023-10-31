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

        String sigla = "HbbrbbbppbpbbpbH";
        sigla = sigla.toUpperCase();
        String nomeTreno = "dsaodska";

        VagoneFactory f = new TNVagoneFactory();
        TrenoBuilder b = new ConcreteBuilder(f);
        TrenoService tService = new TrenoService();

        UtenteBuilder u = new UtenteBuilder();
        UtenteService uService = new UtenteService();
        
        // Utente utenteTrovato1 = uService.findByEmail("sonogianni@daje.com");
        // Utente utenteTrovato2 = uService.findByEmail("ilCollezionista@nonlascionulla.com");

        String immagine = "https://mantovauno.it/wp-content/uploads/2020/07/ETR_500_Frecciarossa_at_platform_in_Milano_Centrale-e1520333682748.jpg";
        // Treno t =tService.find(2);

        Treno t = b.costruisciTreno(sigla, nomeTreno, immagine);
        Utente utente = u.creaUtente("Domenico", "Frau", "domenico.frau@outlook.com", "12345");

//        uService.crea(utente);
        t.setUtente(t, utente);

        // Treno t =tService.findByName("B");
        // t.vendiTreno(t, utenteTrovato1, utenteTrovato2);
        // t.setUtente(t, utenteTrovato2);

        tService.crea(t);

        // tService.update(t);
        // uService.update(utenteTrovato1);
        // uService.update(utenteTrovato2);

        if (sessionFactory != null) {
            HibernateUtil.shutdown();
        }
    }
}