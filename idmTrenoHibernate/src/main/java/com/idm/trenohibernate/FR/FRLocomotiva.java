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

	public FRLocomotiva(int lunghezza, int peso, int prezzo, int pesoTrainabile) {
		super(lunghezza, peso, prezzo, pesoTrainabile);
		// TODO Auto-generated constructor stub
	}

	

}
