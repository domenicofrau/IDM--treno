package com.idm.trenohibernate.FR;

import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.TipoVagone;

public class FRRistorante extends Ristorante {

	public FRRistorante() {
		super();
		this.setTipo(TipoVagone.RISTORANTE);
	}

	public FRRistorante(int lunghezza, int peso, int prezzo, int tavoli, boolean servizi) {
		super(lunghezza, peso, prezzo, tavoli, servizi, TipoVagone.RISTORANTE);
	}

}