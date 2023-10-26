package com.idm.trenohibernate.FR;


import com.idm.trenohibernate.PasseggeriBusiness;
import com.idm.trenohibernate.Vagone;

public class FRPasseggeriBusiness extends PasseggeriBusiness{
	
	private Vagone vagone;

	public FRPasseggeriBusiness(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili,
			boolean servizi) {
		super(lunghezza, peso, prezzo, postiNormali, postiDisabili, servizi);
		// TODO Auto-generated constructor stub
	}
	
	public Vagone getVagone() {
		return vagone;
	}

	public void setVagone(Vagone vagone) {
		this.vagone = vagone;
	}

}
