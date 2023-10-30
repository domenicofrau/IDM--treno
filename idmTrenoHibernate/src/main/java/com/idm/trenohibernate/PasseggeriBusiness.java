package com.idm.trenohibernate;

public class PasseggeriBusiness extends Passeggeri {

	public PasseggeriBusiness(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili, boolean servizi,
			TipoVagone tipo) {
		super(lunghezza, peso, prezzo, postiNormali, postiDisabili, servizi, tipo);
	}

	public PasseggeriBusiness() {
	}

	@Override
	public String toString() {
		return "PasseggeriBusiness [" + super.toString() + "]";
	}

}
