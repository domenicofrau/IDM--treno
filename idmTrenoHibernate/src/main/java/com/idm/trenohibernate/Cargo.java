package com.idm.trenohibernate;

import lombok.*;

@Getter
@Setter
@ToString(callSuper = true)
@NoArgsConstructor

public class Cargo extends Vagone {

	private int pesoTotale;
	private int pesoMerce;
	private TipoMerce tipoMerce;

	public Cargo(int lunghezza, int peso, int prezzo, TipoMerce tipoMerce, int pesoMerce, TipoVagone tipo) {
		super(lunghezza, peso, prezzo, tipo);
		this.pesoTotale = peso + pesoMerce;
		this.tipoMerce = tipoMerce;
	}
	@Override
    public int compareTo(Vagone other) {
        return Integer.compare(this.getId(), other.getId());
    }
	@Override
	public String toString() {
		return "Cargo [pesoTotale=" + pesoTotale + ", pesoMerce=" + pesoMerce + ", tipoMerce=" + tipoMerce
				+ super.toString() + "]";
	}
}