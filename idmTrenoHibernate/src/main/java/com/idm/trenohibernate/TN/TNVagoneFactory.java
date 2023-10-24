package com.idm.trenohibernate.TN;

import org.springframework.stereotype.Component;

import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.Vagone;
import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.VagoneFactory;
import com.idm.trenohibernate.FR.FRCargo;
import com.idm.trenohibernate.FR.FRLocomotiva;
import com.idm.trenohibernate.FR.FRPasseggeri;
import com.idm.trenohibernate.FR.FRRistorante;

@Component
public class TNVagoneFactory implements VagoneFactory {

	public Locomotiva costruisciLocomotiva() {
		return new FRLocomotiva(50, 100, 300, TipoVagone.LOCOMOTIVA);
	}

	public Passeggeri costruisciPasseggeri() {
		return new FRPasseggeri(50, 100, 300, TipoVagone.PASSEGGERI);
	}

	public Ristorante costruisciRistorante() {
		return new FRRistorante(50, 100, 300, TipoVagone.RISTORANTE);
	}

	public Cargo costruisciCargo() {
		return new FRCargo(50, 100, 300, TipoVagone.CARGO);
	}

}
