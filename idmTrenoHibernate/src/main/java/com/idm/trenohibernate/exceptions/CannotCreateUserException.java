package com.idm.trenohibernate.exceptions;

@SuppressWarnings("serial")
public class CannotCreateUserException extends UtenteException {
	
	public String campo;
	public CannotCreateUserException(String message, String campo) {
		
		super(message);
		this.campo= campo;
	}

}
