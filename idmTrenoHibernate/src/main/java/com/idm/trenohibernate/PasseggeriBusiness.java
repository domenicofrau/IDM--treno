package com.idm.trenohibernate;

public class PasseggeriBusiness extends Passeggeri{

	public PasseggeriBusiness(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili,
			boolean servizi) {
		super(lunghezza, peso, prezzo, postiNormali, postiDisabili, servizi);
		// TODO Auto-generated constructor stub
	}
	
	public PasseggeriBusiness() {}

	@Override
	public String toString() {
		return "PasseggeriBusiness [" + super.toString() + "]";
	}
	
	

}
