package com.idm.trenohibernate.exceptions;

@SuppressWarnings("serial")
public class VagoniIncompatibiliException extends TrenoException {

	private int vagone1;
	private int vagone2;

	public VagoniIncompatibiliException(String message, String sigla, int vagone1, int vagone2) {
		super(message, sigla);
		this.setVagone1(vagone1);
		this.setVagone2(vagone2);
	}

	public int getVagone1() {
		return vagone1;
	}

	public void setVagone1(int vagone1) {
		this.vagone1 = vagone1;
	}

	public int getVagone2() {
		return vagone2;
	}

	public void setVagone2(int vagone2) {
		this.vagone2 = vagone2;
	}
}
