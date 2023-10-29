package com.idm.trenohibernate.FR;

import com.idm.trenohibernate.PasseggeriBusiness;
import com.idm.trenohibernate.TipoVagone;

public class FRPasseggeriBusiness extends PasseggeriBusiness {

	public FRPasseggeriBusiness() {
		super();
		this.setTipo(TipoVagone.PASSEGGERI_BUSINESS);
	}

	public FRPasseggeriBusiness(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili,
			boolean servizi) {
		super(lunghezza, peso, prezzo, postiNormali, postiDisabili, servizi, TipoVagone.PASSEGGERI_BUSINESS);
	}
	
}