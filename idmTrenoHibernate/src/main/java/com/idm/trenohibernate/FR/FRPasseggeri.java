package com.idm.trenohibernate.FR;

import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.Vagone;

public class FRPasseggeri extends Passeggeri {

	public FRPasseggeri() {
		super();
		this.setTipo(TipoVagone.PASSEGGERI);
	}

	public FRPasseggeri(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili, boolean servizi) {
		super(lunghezza, peso, prezzo, postiNormali, postiDisabili, servizi, TipoVagone.PASSEGGERI);
	}
}