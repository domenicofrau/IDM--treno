package com.idm.trenohibernate.FR;

import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.Vagone;

public class FRRistorante extends Ristorante {
	
	private Vagone vagone;

	public FRRistorante(int lunghezza, int peso, int prezzo, int tavoli, boolean servizi) {
		super(lunghezza, peso, prezzo, tavoli, servizi);
		// TODO Auto-generated constructor stub
	}

	public Vagone getVagone() {
		return vagone;
	}

	public void setVagone(Vagone vagone) {
		this.vagone = vagone;
	}
}