package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.Vagone;

public class TNPasseggeri extends Passeggeri {
	private Vagone vagone;

	public Vagone getVagone() {
		return vagone;
	}

	public void setVagone(Vagone vagone) {
		this.vagone = vagone;
	}

	public TNPasseggeri(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili, boolean servizi) {
		super(lunghezza, peso, prezzo, postiNormali, postiDisabili, servizi);
		// TODO Auto-generated constructor stub
	}

	

}