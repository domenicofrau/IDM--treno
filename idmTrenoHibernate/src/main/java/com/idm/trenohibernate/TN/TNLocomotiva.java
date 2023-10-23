package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Vagone;

public class TNLocomotiva extends Locomotiva {
	private Vagone vagone;

	public Vagone getVagone() {
		return vagone;
	}

	public void setVagone(Vagone vagone) {
		this.vagone = vagone;
	}

	public TNLocomotiva(int posti, int lunghezza, int peso) {
		super(posti, lunghezza, peso);
	}

}