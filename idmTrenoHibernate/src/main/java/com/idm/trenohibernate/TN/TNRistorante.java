package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.TipoVagone;

public class TNRistorante extends Ristorante {

	public TNRistorante() {
		super();
		this.setTipo(TipoVagone.RISTORANTE);
	}

	public TNRistorante(int lunghezza, int peso, int prezzo, int tavoli, boolean servizi) {
		super(lunghezza, peso, prezzo, tavoli, servizi, TipoVagone.RISTORANTE);
	}

}