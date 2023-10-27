package com.idm.trenohibernate;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.idm.trenohibernate.exceptions.TrenoException;

@Component
public class ConcreteBuilder extends TrenoBuilder {

	private VagoneFactory factory;

	public ConcreteBuilder(@Qualifier("FRVagoneFactory") VagoneFactory factory) {
		this.factory = factory;
	}

	public Treno costruisciTreno(String sigla,String nome,  VagoneFactory factory)
			throws TrenoException {
		this.factory = factory;
		return super.costruisciTreno(sigla, nome);
	}

	@Override
	protected Locomotiva costruisciLocomotiva() {
		return factory.costruisciLocomotiva();
	}

	@Override
	protected Passeggeri costruisciPasseggeri() {
		return factory.costruisciPasseggeri();
	}

	@Override
	protected Ristorante costruisciRistorante() {
		return factory.costruisciRistorante();
	}

	@Override
	protected Cargo costruisciCargo() {
		return factory.costruisciCargo();
	}

	@Override
	protected String impostaMarca() {
		return factory.getClass().getSimpleName();
	}

	@Override
	protected PasseggeriBusiness costruisciPasseggeriBusiness() {
		return factory.costruisciPasseggeriBusiness();
	}
}