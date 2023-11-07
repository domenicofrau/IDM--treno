package idm.servlet.bean;

public class TrenoFilter {
	
	private String nomeLike;
	private String marca;
	private String regione;
	private int prezzoMin;
	private int prezzoMax;
	private boolean inVendita;
	
	public String getNomeLike() {
		return nomeLike;
	}
	public void setNomeLike(String nomeLike) {
		this.nomeLike = nomeLike;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getRegione() {
		return regione;
	}
	public void setRegione(String regione) {
		this.regione = regione;
	}
	public int getPrezzoMin() {
		return prezzoMin;
	}
	public void setPrezzoMin(int prezzoMin) {
		this.prezzoMin = prezzoMin;
	}
	public int getPrezzoMax() {
		return prezzoMax;
	}
	public void setPrezzoMax(int prezzoMax) {
		this.prezzoMax = prezzoMax;
	}
	public boolean isInVendita() {
		return inVendita;
	}
	public void setInVendita(boolean inVendita) {
		this.inVendita = inVendita;
	}
	
}
