package com.idm.trenohibernate.exceptions;

@SuppressWarnings("serial")
public class LocomotivaException extends TrenoException {

	public LocomotivaException(String message, String sigla) {
		super(message, sigla);
	}

}