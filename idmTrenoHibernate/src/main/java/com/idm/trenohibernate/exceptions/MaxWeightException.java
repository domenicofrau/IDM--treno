package com.idm.trenohibernate.exceptions;

@SuppressWarnings("serial")
public class MaxWeightException extends TrenoException {

	public MaxWeightException(String message, String sigla) {
		super(message, sigla);
	}

}