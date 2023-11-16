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

}