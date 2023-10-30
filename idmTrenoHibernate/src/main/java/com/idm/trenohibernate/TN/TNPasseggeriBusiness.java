package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.PasseggeriBusiness;
import com.idm.trenohibernate.TipoVagone;

public class TNPasseggeriBusiness extends PasseggeriBusiness {

	public TNPasseggeriBusiness() {
		super();
		this.setTipo(TipoVagone.PASSEGGERI_BUSINESS);
	}

	public TNPasseggeriBusiness(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili,
			boolean servizi) {
		super(lunghezza, peso, prezzo, postiNormali, postiDisabili, servizi, TipoVagone.PASSEGGERI_BUSINESS);
	}

}