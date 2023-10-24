package com.idm.trenohibernate.TN;

import org.springframework.stereotype.Component;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.VagoneFactory;

@Component
public class TNVagoneFactory implements VagoneFactory {

	public Locomotiva costruisciLocomotiva() {
		return new TNLocomotiva(50, 100, 300, TipoVagone.LOCOMOTIVA);
	}

	public Passeggeri costruisciPasseggeri() {
		return new TNPasseggeri(50, 100, 300, TipoVagone.PASSEGGERI);
	}

	public Ristorante costruisciRistorante() {
		return new TNRistorante(50, 100, 300, TipoVagone.RISTORANTE);
	}

	public Cargo costruisciCargo() {
		return new TNCargo(50, 100, 300, TipoVagone.CARGO);
	}

}
