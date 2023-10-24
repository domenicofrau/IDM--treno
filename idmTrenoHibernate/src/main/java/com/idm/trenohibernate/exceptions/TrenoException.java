package com.idm.trenohibernate.exceptions;

@SuppressWarnings("serial")
public class TrenoException extends Exception {

	private String sigla;

	public TrenoException(String message, String sigla) {
		super(message);
		this.sigla = sigla;
	}

	public String getSigla() {
		return sigla;
	}

}
