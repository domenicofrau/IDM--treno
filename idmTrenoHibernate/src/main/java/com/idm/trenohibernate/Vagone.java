package com.idm.trenohibernate;

public abstract class Vagone {

	private int id;
	private int lunghezza;
	private int peso;
	private int prezzo;
	private Treno treno;
	
//	private TipoVagone tipo;
//
//	public TipoVagone getTipo() {
//		return tipo;
//	}e
//	public void setTipo(TipoVagone tipo) {
//		this.tipo = tipo;
//	}
	

	public Vagone() {}
	
	public Vagone(int lunghezza, int peso, int prezzo) {
		this.lunghezza = lunghezza;
		this.peso = peso;
		this.prezzo = prezzo;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLunghezza() {
		return lunghezza;
	}

	public void setLunghezza(int lunghezza) {
		this.lunghezza = lunghezza;
	}

	public int getPeso() {
		return peso;
	}

	public void setPeso(int peso) {
		this.peso = peso;
	}

	public Treno getTreno() {
		return treno;
	}

	public void setTreno(Treno treno) {
		this.treno = treno;
	}

	public int getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(int prezzo) {
		this.prezzo = prezzo;
	}

	@Override
	public String toString() {
		return "lunghezza=" + lunghezza + ", peso=" + peso + ", prezzo=" + prezzo;
	}
	
	

}