package com.idm.trenohibernate;

import lombok.*;

@Getter
@Setter
@ToString(callSuper = true)
@NoArgsConstructor

public class Locomotiva extends Vagone {

	private int pesoTrainabile;

	public Locomotiva(int lunghezza, int peso, int prezzo, int pesoTrainabile, TipoVagone tipo) {
		super(lunghezza, peso, prezzo, tipo);
		this.pesoTrainabile = pesoTrainabile;
	}

}