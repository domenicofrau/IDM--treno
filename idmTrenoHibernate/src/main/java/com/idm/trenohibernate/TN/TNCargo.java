package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.TipoMerce;
import com.idm.trenohibernate.TipoVagone;

public class TNCargo extends Cargo {

	public TNCargo() {
		super();
		this.setTipo(TipoVagone.CARGO);
	}

	public TNCargo(int lunghezza, int peso, int prezzo, TipoMerce tipoMerce, int pesoMerce) {
		super(lunghezza, peso, prezzo, tipoMerce, pesoMerce, TipoVagone.CARGO);
	}

}
