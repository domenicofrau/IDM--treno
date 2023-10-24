package com.idm.trenohibernate.FR;

import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.Vagone;

public class FRRistorante extends Ristorante {
	private Vagone vagone;

	public FRRistorante(int posti, int lunghezza, int peso, TipoVagone tipo) {
		super(posti, lunghezza, peso, tipo);
	}

	public Vagone getVagone() {
		return vagone;
	}

	public void setVagone(Vagone vagone) {
		this.vagone = vagone;
	}
}