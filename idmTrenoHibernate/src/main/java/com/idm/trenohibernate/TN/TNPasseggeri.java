package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Vagone;

public class TNPasseggeri extends Locomotiva {
	private Vagone vagone;

	public Vagone getVagone() {
		return vagone;
	}

	public void setVagone(Vagone vagone) {
		this.vagone = vagone;
	}

	public TNPasseggeri(int posti, int lunghezza, int peso) {
		super(posti, lunghezza, peso);
	}

}