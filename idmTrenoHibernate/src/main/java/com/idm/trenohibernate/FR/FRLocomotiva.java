package com.idm.trenohibernate.FR;

import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Vagone;

public class FRLocomotiva extends Locomotiva {
	private Vagone vagone;

	public Vagone getVagone() {
		return vagone;
	}

	public void setVagone(Vagone vagone) {
		this.vagone = vagone;
	}

	public FRLocomotiva(int posti, int lunghezza, int peso) {
		super(posti, lunghezza, peso);
	}

}
