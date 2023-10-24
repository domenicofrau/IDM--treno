package com.idm.trenohibernate;

import java.util.Set;

import com.idm.trenohibernate.TN.TNCargo;
import com.idm.trenohibernate.TN.TNPasseggeri;

public class Vagone {

	private int id;
	private int posti;
	private int lunghezza;
	private int peso;
	private TipoVagone tipo;

	private Treno treno;
	
	public Vagone() {}
	public Vagone(int posti, int lunghezza, int peso, TipoVagone tipo) {
		this.posti = posti;
		this.lunghezza = lunghezza;
		this.peso = peso;
		this.tipo = tipo;
	}

	@Override
	public String toString() {
		return String.format("%-10s\t[posti=%d, lunghezza=%d, peso=%d]", tipo, posti, lunghezza,
				peso);
	}



	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPosti() {
		return posti;
	}

	public void setPosti(int posti) {
		this.posti = posti;
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
	public TipoVagone getTipo() {
		return tipo;
	}
	public void setTipo(TipoVagone tipo) {
		this.tipo = tipo;
	}
	
	

	

}