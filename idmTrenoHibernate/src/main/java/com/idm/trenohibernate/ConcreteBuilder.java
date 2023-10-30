package com.idm.trenohibernate;

import org.springframework.stereotype.Component;

import com.idm.trenohibernate.exceptions.TrenoException;

@Component
public class ConcreteBuilder extends TrenoBuilder {

	private VagoneFactory factory;

	public ConcreteBuilder(VagoneFactory factory) {
		this.factory = factory;
	}

	public Treno costruisciTreno(String sigla, String nome, VagoneFactory factory)
			throws TrenoException {
		this.factory = factory;
		return super.costruisciTreno(sigla, nome);
	}

	@Override
	protected Locomotiva costruisciLocomotiva() {
		return factory.costruisciLocomotiva(TipoVagone.LOCOMOTIVA);
	}

	@Override
	protected Passeggeri costruisciPasseggeri() {
		return factory.costruisciPasseggeri(TipoVagone.PASSEGGERI);
	}

	@Override
	protected PasseggeriBusiness costruisciPasseggeriBusiness() {
		return factory.costruisciPasseggeriBusiness(TipoVagone.PASSEGGERI_BUSINESS);
	}

	@Override
	protected Ristorante costruisciRistorante() {
		return factory.costruisciRistorante(TipoVagone.RISTORANTE);
	}

	@Override
	protected Cargo costruisciCargo() {
		return factory.costruisciCargo(TipoVagone.CARGO);
	}

	@Override
	protected String impostaMarca() {
		return factory.getClass().getSimpleName();
	}

}