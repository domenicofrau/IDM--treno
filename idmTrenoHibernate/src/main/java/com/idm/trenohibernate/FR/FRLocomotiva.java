package com.idm.trenohibernate.FR;

import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.TipoVagone;

public class FRLocomotiva extends Locomotiva {

	public FRLocomotiva() {
		super();
		this.setTipo(TipoVagone.LOCOMOTIVA);
	}

	public FRLocomotiva(int lunghezza, int peso, int prezzo, int pesoTrainabile) {
		super(lunghezza, peso, prezzo, pesoTrainabile, TipoVagone.LOCOMOTIVA);
	}

}
