package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.Vagone;

public class TNRistorante extends Ristorante {
	
	private Vagone vagone;
	
	public TNRistorante() {}
	
	public TNRistorante(int lunghezza, int peso, int prezzo, int tavoli, boolean servizi) {
		super(lunghezza, peso, prezzo, tavoli, servizi);
	}

	public Vagone getVagone() {
		return vagone;
	}

	public void setVagone(Vagone vagone) {
		this.vagone = vagone;
	}
	
}