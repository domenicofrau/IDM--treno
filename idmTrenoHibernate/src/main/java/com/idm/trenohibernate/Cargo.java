package com.idm.trenohibernate;

public class Cargo extends Vagone {

	private int pesoTotale;
	private int pesoMerce;
	private TipoMerce tipoMerce;

	public Cargo(int lunghezza, int peso, int prezzo, TipoMerce tipoMerce, int pesoMerce, TipoVagone tipo) {
		super(lunghezza, peso, prezzo, tipo);
		this.pesoTotale = peso + pesoMerce;
		this.tipoMerce = tipoMerce;
	}

	public Cargo() {
		super();
	}

	public int getPesoTotale() {
		return pesoTotale;
	}

	public void setPesoTotale(int pesoTotale) {
		this.pesoTotale = pesoTotale;
	}

	public int getPesoMerce() {
		return pesoMerce;
	}

	public void setPesoMerce(int pesoMerce) {
		this.pesoMerce = pesoMerce;
	}

	public TipoMerce getTipoMerce() {
		return tipoMerce;
	}

	public void setTipoMerce(TipoMerce tipoMerce) {
		this.tipoMerce = tipoMerce;
	}

	@Override
	public String toString() {
		return "Cargo [pesoTotale=" + pesoTotale + ", pesoMerce=" + pesoMerce + ", tipoMerce=" + tipoMerce
				+ super.toString() + "]";
	}

	@Override
    public int compareTo(Vagone other) {
        // Implement comparison logic based on your requirements
        // For example, compare by some property like ID or another field.
        return Integer.compare(this.getId(), other.getId());
    }

}