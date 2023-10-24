package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.Vagone;

public class TNCargo extends Cargo {
	private Vagone vagone;

	public Vagone getVagone() {
		return vagone;
	}

	public void setVagone(Vagone vagone) {
		this.vagone = vagone;
	}

	public TNCargo(int posti, int lunghezza, int peso, TipoVagone tipo) {
		super(posti, lunghezza, peso, tipo);
	}

}
