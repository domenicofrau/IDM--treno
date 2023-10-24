package com.idm.trenohibernate.exceptions;

public class VagoniIncompatibiliException extends TrenoException {
	
	private int vagone1;
	private int vagone2;
	
	
	public VagoniIncompatibiliException(String message, String sigla, int vagone1, int vagone2) {
		super(message, sigla);
		this.vagone1 = vagone1;
		this.vagone2 = vagone2;
	}
}
