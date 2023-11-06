package idm.servlet.bean;

public class TrenoBean {

	private String sigla;
	private String nomeTreno;
	private String urlImmagine;
	private String regione;
	private boolean inVendita;

	public String getRegione() {
		return regione;
	}

	public void setRegione(String regione) {
		this.regione = regione;
	}

	public String getSigla() {
		return sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

	public String getNomeTreno() {
		return nomeTreno;
	}

	public void setNomeTreno(String nomeTreno) {
		this.nomeTreno = nomeTreno;
	}

	public String getUrlImmagine() {
		return urlImmagine;
	}

	public void setUrlImmagine(String urlImmagine) {
		this.urlImmagine = urlImmagine;
	}

	public boolean isInVendita() {
		return inVendita;
	}

	public void setInVendita(boolean inVendita) {
		this.inVendita = inVendita;
	}

}
