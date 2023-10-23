package com.idm.trenohibernate.FR;

import org.springframework.stereotype.Component;

import com.idm.trenohibernate.Vagone;
import com.idm.trenohibernate.VagoneFactory;

@Component
public class FRVagoneFactory implements VagoneFactory {

	public Vagone costruisciLocomotiva() {
		return new FRLocomotiva(50, 100, 300);
	}

	public Vagone costruisciPasseggeri() {
		return new FRPasseggeri(50, 100, 300);
	}

	public Vagone costruisciRistorante() {
		return new FRRistorante(50, 100, 300);
	}

	public Vagone costruisciCargo() {
		return new FRCargo(50, 100, 300);
	}

}