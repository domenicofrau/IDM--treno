package com.idm.trenohibernate.FR;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.VagoneFactory;

@Component
@Primary
public class FRVagoneFactory implements VagoneFactory {

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