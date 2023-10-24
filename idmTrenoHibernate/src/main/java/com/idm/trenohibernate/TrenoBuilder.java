package com.idm.trenohibernate;

import java.util.function.IntPredicate;

import com.idm.trenohibernate.exceptions.*;

public abstract class TrenoBuilder {

	public Treno costruisciTreno(String sigla)
			throws LocomotivaException, VagoniIncompatibiliException, RistoranteException {

		// locomotiva obbligatoria
		if (!sigla.contains("H")) {
			
			throw new LocomotivaException("La locomotiva è obbligatoria", sigla);		
		}
		// locomotiva in testa
		if (sigla.charAt(0) != 'H')
			throw new LocomotivaException("Locomotiva non in testa", sigla);

		// non più di due locomotive
		long contaH = sigla.chars().filter(new IntPredicate() {
			public boolean test(int ch) {
				return ch == 'H';
			}
		}).count();
		if (contaH > 2) {
			throw new LocomotivaException("La locomotiva non può essere presente più di due volte", sigla);
		}

		// la seconda locomotiva deve essere obbligatoriamente in coda
		if (contaH == 2 && sigla.charAt(sigla.length() - 1) != 'H') {
			throw new LocomotivaException("La seconda locomotiva deve essere in coda", sigla);
		}

		// se è presente un vagone passeggeri deve essere presente il vagone ristorante
		if (sigla.contains("P") && !sigla.contains("R")) {
			throw new RistoranteException("Se è presente un vagone passeggeri, è obbligatorio un vagone ristorante",
					sigla);
		}

		if (sigla.contains("C") && sigla.contains("P")) {
			throw new VagoniIncompatibiliException(
					"I vagoni sono incompatibili. Presenza di Cargo e Passeggeri insieme.", sigla, sigla.indexOf('C'),
					sigla.indexOf('P'));
		}

		if (sigla.contains("R") && sigla.contains("C")) {
			throw new VagoniIncompatibiliException(
					"I vagoni sono incompatibili Presenza di Cargo e Ristorante insieme.", sigla, sigla.indexOf('R'),
					sigla.indexOf('C'));
		}

		Treno t = new Treno();

		for (int i = 0; i < sigla.length(); i++) {

			char c = sigla.charAt(i);

			switch (c) {
			case 'H':
				t.getVagoni().add(costruisciLocomotiva());
				break;
			case 'P':
				t.getVagoni().add(costruisciPasseggeri());
				break;
			case 'R':
				t.getVagoni().add(costruisciRistorante());
				break;
			case 'C':
				t.getVagoni().add(costruisciCargo());
				break;
			}
		}

		t.setMarca(impostaMarca());

		return t;
	}

	protected abstract String impostaMarca();

	protected abstract Vagone costruisciLocomotiva();

	protected abstract Vagone costruisciPasseggeri();

	protected abstract Vagone costruisciRistorante();

	protected abstract Vagone costruisciCargo();

}
