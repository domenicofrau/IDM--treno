package com.idm.trenohibernate;

public class Passeggeri extends Vagone {

	private int postiNormali;
	private int postiDisabili;
	private int postiTotali;
	private boolean servizi;

	public Passeggeri(int lunghezza, int peso, int prezzo, int postiNormali, int postiDisabili, boolean servizi,
			TipoVagone tipo) {
		super(lunghezza, peso, prezzo, tipo);
		this.postiNormali = postiNormali;
		this.postiDisabili = postiDisabili;
		this.postiTotali = postiNormali + postiDisabili;
		this.servizi = servizi;
	}

	public int getPostiNormali() {
		return postiNormali;
	}

	public void setPostiNormali(int postiNormali) {
		this.postiNormali = postiNormali;
	}

	public int getPostiDisabili() {
		return postiDisabili;
	}

	public void setPostiDisabili(int postiDisabili) {
		this.postiDisabili = postiDisabili;
	}

	public int getPostiTotali() {
		return postiTotali;
	}

	public void setPostiTotali(int postiTotali) {
		this.postiTotali = postiTotali;
	}

	public boolean isServizi() {
		return servizi;
	}

	public void setServizi(boolean servizi) {
		this.servizi = servizi;
	}

	public Passeggeri() {
		super();
	}

	@Override
	public String toString() {
		return "Passeggeri [postiNormali=" + postiNormali + ", postiDisabili=" + postiDisabili + ", postiTotali="
				+ postiTotali + ", servizi=" + servizi + " " + super.toString() + "]";
	}

}