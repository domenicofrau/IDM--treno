package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Vagone;
import com.idm.trenohibernate.VagoneFactory;

public class TNVagoneFactory implements VagoneFactory {

	public Vagone costruisciLocomotiva() {
		return new TNLocomotiva(50, 100, 300);
	}

	public Vagone costruisciPasseggeri() {
		return new TNPasseggeri(50, 100, 300);
	}

	public Vagone costruisciRistorante() {
		return new TNRistorante(50, 100, 300);
	}

	public Vagone costruisciCargo() {
		return new TNCargo(50, 100, 300);
	}

}
