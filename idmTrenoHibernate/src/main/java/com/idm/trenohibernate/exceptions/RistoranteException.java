package com.idm.trenohibernate.exceptions;

@SuppressWarnings("serial")
public class RistoranteException extends TrenoException {

	public RistoranteException(String message, String sigla) {
		super(message, sigla);
	}

}