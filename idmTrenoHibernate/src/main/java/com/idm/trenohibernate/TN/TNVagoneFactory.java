package com.idm.trenohibernate.TN;

import org.springframework.stereotype.Component;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.PasseggeriBusiness;
import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.TipoMerce;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.VagoneFactory;

@Component
public class TNVagoneFactory implements VagoneFactory {

	public Locomotiva costruisciLocomotiva(TipoVagone tipo) {
		return new TNLocomotiva(10, 20, 150, 1000);
	}

	public Passeggeri costruisciPasseggeri(TipoVagone tipo) {
		return new TNPasseggeri(18, 15, 40, 40, 4, false);
	}

	public PasseggeriBusiness costruisciPasseggeriBusiness(TipoVagone tipo) {
		return new TNPasseggeriBusiness(18, 15, 60, 24, 2, true);
	}

	public Ristorante costruisciRistorante(TipoVagone tipo) {
		return new TNRistorante(16, 12, 120, 10, false);
	}

	public Cargo costruisciCargo(TipoVagone tipo) {
		return new TNCargo(16, 8, 30, TipoMerce.MERCE_INDUSTRIALE, 17);
	}

}