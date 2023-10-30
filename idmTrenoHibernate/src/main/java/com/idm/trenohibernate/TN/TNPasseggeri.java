package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.TipoVagone;

public class TNPasseggeri extends Passeggeri {

	public TNPasseggeri() {
		super();
		this.setTipo(TipoVagone.PASSEGGERI);
	}

	public TNPasseggeri(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili, boolean servizi) {
		super(lunghezza, peso, prezzo, postiNormali, postiDisabili, servizi, TipoVagone.PASSEGGERI);
	}

}