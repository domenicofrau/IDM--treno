package com.idm.trenohibernate.exceptions;

@SuppressWarnings("serial")
public class SaldoNonSufficenteException extends UtenteException{

	private int saldo;
	public SaldoNonSufficenteException(String message, int saldo) {
		super(message);
		this.setSaldo(saldo);
	}
	public int getSaldo() {
		return saldo;
	}
	public void setSaldo(int saldo) {
		this.saldo = saldo;
	}
}
