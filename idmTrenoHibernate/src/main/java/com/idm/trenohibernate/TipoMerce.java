package com.idm.trenohibernate;

public enum TipoMerce {

	RIFIUTI_RADIOATTIVI(0), MERCE_INDUSTRIALE(1), MERCE_ALIMENTARE(2), MERCE_EDILIZIA(3);

	private int value;

	private TipoMerce(int value) {
		this.setValue(value);
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

}
