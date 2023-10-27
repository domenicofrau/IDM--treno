package com.idm.trenohibernate.TN;

import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.TipoVagone;
import com.idm.trenohibernate.Vagone;

public class TNLocomotiva extends Locomotiva {
	
	private Vagone vagone;
	
	public TNLocomotiva() {}
	
	public TNLocomotiva(int lunghezza, int peso, int prezzo, int pesoTrainabile) {
		super(lunghezza, peso, prezzo, pesoTrainabile);
	}

	public Vagone getVagone() {
		return vagone;
	}

	public void setVagone(Vagone vagone) {
		this.vagone = vagone;
	}	

}
