package com.idm.trenohibernate;

public class ConcreteBuilder extends TrenoBuilder {

	private VagoneFactory factory;

	public ConcreteBuilder(VagoneFactory factory) {
		this.factory = factory;
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