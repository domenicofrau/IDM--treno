package com.idm.trenohibernate;
import com.idm.trenohibernate.dao.Bean;

public abstract class Vagone implements Bean, Comparable <Vagone>{

	private int id;
	private int lunghezza;
	private int peso;
	private int prezzo;
	private Treno treno;
	private TipoVagone tipo;
	private int posizione;
	

	public Vagone() {
	}

	public Vagone(int lunghezza, int peso, int prezzo, TipoVagone tipo) {
		this.lunghezza = lunghezza;
		this.peso = peso;
		this.prezzo = prezzo;
		this.tipo = tipo;
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

	public TipoVagone getTipo() {
		return tipo;
	}

	public void setTipo(TipoVagone tipo) {
		this.tipo = tipo;
	}

	@Override
	public String toString() {
		return "lunghezza=" + lunghezza + ", peso=" + peso + ", prezzo=" + prezzo;
	}

	public int getPosizione() {
		return posizione;
	}

	public void setPosizione(int posizione) {
		this.posizione = posizione;
	}

}
