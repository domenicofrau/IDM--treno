package com.idm.trenohibernate.FR;

import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.Vagone;

public class FRPasseggeri extends Passeggeri {
	private Vagone vagone;

	public Vagone getVagone() {
		return vagone;
	}

	public void setVagone(Vagone vagone) {
		this.vagone = vagone;
	}

	public FRPasseggeri(int posti, int lunghezza, int peso, TipoVagone tipo) {
		super(posti, lunghezza, peso, tipo);
	}

}