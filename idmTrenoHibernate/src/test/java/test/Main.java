package test;

import com.idm.trenohibernate.*;
import com.idm.trenohibernate.FR.*;
import com.idm.trenohibernate.TN.TNVagoneFactory;
import com.idm.trenohibernate.dao.TrenoHibernateDAO;
import com.idm.trenohibernate.dao.TrenoHibernateDAOImpl;
import com.idm.trenohibernate.exceptions.LocomotivaException;
import com.idm.trenohibernate.exceptions.RistoranteException;
import com.idm.trenohibernate.exceptions.VagoniIncompatibiliException;
import com.idm.trenohibernate.utils.HibernateUtil;
import com.idm.trenohibernate.service.*;
import org.hibernate.SessionFactory;

public class Main {
	public static void main(String[] args)
			throws LocomotivaException, VagoniIncompatibiliException, RistoranteException {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		System.out.println("run.....");

		String sigla = "HppprppH";
		sigla = sigla.toUpperCase();
		
		TNVagoneFactory f = new TNVagoneFactory();
		TrenoBuilder b = new ConcreteBuilder(f);
		
		Treno t1 = b.costruisciTreno(sigla);
		Treno t2 = b.costruisciTreno(sigla);
		Treno t3 = b.costruisciTreno(sigla);
		Treno t4 = b.costruisciTreno(sigla);
		Treno t5 = b.costruisciTreno(sigla);
		

		TrenoHibernateDAO dao = new TrenoHibernateDAOImpl();
		
		TrenoService tService = new TrenoService();
		
		tService.crea(t1);
		tService.crea(t2);
//		tService.crea(t3);
//		tService.crea(t4);
//		tService.crea(t5);
//		tService.findAll();
//		tService.delete(113);
//		tService.find(113);

		if (sessionFactory != null) {
			HibernateUtil.shutdown();
		}
	}
}