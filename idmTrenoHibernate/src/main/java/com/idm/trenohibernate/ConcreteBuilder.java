package com.idm.trenohibernate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.idm.trenohibernate.exceptions.LocomotivaException;
import com.idm.trenohibernate.exceptions.RistoranteException;
import com.idm.trenohibernate.exceptions.VagoniIncompatibiliException;

@Component
public class ConcreteBuilder extends TrenoBuilder {

	private VagoneFactory factory;
    
    public Treno costruisciTreno(String sigla, VagoneFactory factory) throws LocomotivaException, VagoniIncompatibiliException, RistoranteException {
        this.factory = factory;
        return super.costruisciTreno(sigla);
    }
	
	@Override
	protected Vagone costruisciLocomotiva() {
		return factory.costruisciLocomotiva();
	}

	@Override
	protected Vagone costruisciPasseggeri() {
		return factory.costruisciPasseggeri();
	}

	@Override
	protected Vagone costruisciRistorante() {
		return factory.costruisciRistorante();
	}

	@Override
	protected Vagone costruisciCargo() {
		return factory.costruisciCargo();
	}

	@Override
	protected String impostaMarca() {
		return factory.getClass().getSimpleName();
	}
}