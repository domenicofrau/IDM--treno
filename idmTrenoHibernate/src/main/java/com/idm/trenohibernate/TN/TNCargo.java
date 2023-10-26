package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.TipoMerce;
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

	public TNCargo(int lunghezza, int peso, int prezzo, TipoMerce tipoMerce, int pesoMerce) {
		super(lunghezza, peso, prezzo, tipoMerce, pesoMerce);
		// TODO Auto-generated constructor stub
	}

	

}
