package com.idm.trenohibernate.FR;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.TipoMerce;
import com.idm.trenohibernate.TipoVagone;

public class FRCargo extends Cargo {

	public FRCargo() {
		super();
		this.setTipo(TipoVagone.CARGO);
	}

	public FRCargo(int lunghezza, int peso, int prezzo, TipoMerce tipoMerce, int pesoMerce) {
		super(lunghezza, peso, prezzo, tipoMerce, pesoMerce, TipoVagone.CARGO);
	}

}