package com.idm.trenohibernate;

import lombok.*;

@NoArgsConstructor
@ToString(callSuper = true)

public class PasseggeriBusiness extends Passeggeri {

	public PasseggeriBusiness(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili, boolean servizi,
			TipoVagone tipo) {
		super(lunghezza, peso, prezzo, postiNormali, postiDisabili, servizi, tipo);
	}

}