package test;

import com.idm.trenohibernate.*;
import com.idm.trenohibernate.FR.*;
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
		
		VagoneFactory f = new FRVagoneFactory();
		TrenoBuilder b = new ConcreteBuilder();
		
		Treno t = b.costruisciTreno(sigla);
		
		System.out.println(t);
		

		TrenoHibernateDAO dao = new TrenoHibernateDAOImpl();
		
		dao.create(t);
		
		
//		TrenoService tService = new TrenoService();
//		tService.findAll();
//		tService.delete(113);
//		tService.find(113);

		if (sessionFactory != null) {
			HibernateUtil.shutdown();
		}
	}
}