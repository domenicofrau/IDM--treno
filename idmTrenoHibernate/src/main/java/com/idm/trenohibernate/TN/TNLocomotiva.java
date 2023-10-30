package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.TipoVagone;

public class TNLocomotiva extends Locomotiva {

	public TNLocomotiva() {
		super();
		this.setTipo(TipoVagone.LOCOMOTIVA);
	}

	public TNLocomotiva(int lunghezza, int peso, int prezzo, int pesoTrainabile) {
		super(lunghezza, peso, prezzo, pesoTrainabile, TipoVagone.LOCOMOTIVA);
	}

}
