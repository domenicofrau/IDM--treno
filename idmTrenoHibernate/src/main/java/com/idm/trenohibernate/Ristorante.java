package com.idm.trenohibernate;

public class Ristorante extends Vagone {

	private int tavoli;
	private int posti;
	private boolean servizi;

	public Ristorante(int lunghezza, int peso, int prezzo, int tavoli, boolean servizi, TipoVagone tipo) {
		super(lunghezza, peso, prezzo, tipo);
		this.tavoli = tavoli;
		this.posti = tavoli * 4;
		this.servizi = servizi;
	}

	public int getTavoli() {
		return tavoli;
	}

	public void setTavoli(int tavoli) {
		this.tavoli = tavoli;
	}

	public int getPosti() {
		return posti;
	}

	public void setPosti(int posti) {
		this.posti = posti;
	}

	public boolean isServizi() {
		return servizi;
	}

	public void setServizi(boolean servizi) {
		this.servizi = servizi;
	}

	public Ristorante() {
		super();
	}

	@Override
	public String toString() {
		return "Ristorante [tavoli=" + tavoli + ", posti=" + posti + ", servizi=" + servizi + " " + super.toString()
				+ "]";
	}
	  @Override
	    public int compareTo(Vagone other) {
	        // Implement comparison logic based on your requirements
	        // For example, compare by some property like ID or another field.
	        return Integer.compare(this.getId(), other.getId());
	    }

}