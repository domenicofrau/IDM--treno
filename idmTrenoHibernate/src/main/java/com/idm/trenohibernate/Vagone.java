package com.idm.trenohibernate;

import java.util.Set;

import com.idm.trenohibernate.TN.TNCargo;
import com.idm.trenohibernate.TN.TNPasseggeri;

public abstract class Vagone {

	private int id;
	private int posti;
	private int lunghezza;
	private int peso;

	private Locomotiva locomotiva;
	private Ristorante ristorante;
	private Set<TNCargo> cargo;
	private Set<TNPasseggeri> passeggeri;

	public Vagone(int posti, int lunghezza, int peso) {
		this.posti = posti;
		this.lunghezza = lunghezza;
		this.peso = peso;
	}

	@Override
	public String toString() {
		return String.format("%-10s\t[posti=%d, lunghezza=%d, peso=%d]", getClass().getSimpleName(), posti, lunghezza,
				peso);
	}

	private Treno treno;

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

	public Set<TNCargo> getCargo() {
		return cargo;
	}

	public void setCargo(Set<TNCargo> cargo) {
		this.cargo = cargo;
	}

	public Set<TNPasseggeri> getPasseggeri() {
		return passeggeri;
	}

	public void setPasseggeri(Set<TNPasseggeri> passeggeri) {
		this.passeggeri = passeggeri;
	}

	public Locomotiva getLocomotiva() {
		return locomotiva;
	}

	public void setLocomotiva(Locomotiva locomotiva) {
		this.locomotiva = locomotiva;
	}

	public Ristorante getRistorante() {
		return ristorante;
	}

	public void setRistorante(Ristorante ristorante) {
		this.ristorante = ristorante;
	}

}