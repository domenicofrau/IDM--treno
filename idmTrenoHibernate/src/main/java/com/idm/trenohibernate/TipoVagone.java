package com.idm.trenohibernate;

public enum TipoVagone {
	LOCOMOTIVA(0), PASSEGGERI(1), RISTORANTE(2), CARGO(3), PASSEGGERI_BUSINESS(4);

	private int value;

	private TipoVagone(int value) {
		this.setValue(value);
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

}
