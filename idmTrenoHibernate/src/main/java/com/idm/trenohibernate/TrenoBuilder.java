package com.idm.trenohibernate;

import java.util.function.IntPredicate;
import com.idm.trenohibernate.exceptions.*;

public abstract class TrenoBuilder {

	public Treno costruisciTreno(String sigla)
			throws LocomotivaException, VagoniIncompatibiliException, RistoranteException {

		if (!sigla.contains("H")) {

			throw new LocomotivaException("La locomotiva è obbligatoria", sigla);
		}

		if (sigla.charAt(0) != 'H')
			throw new LocomotivaException("Locomotiva non in testa", sigla);

		long contaH = sigla.chars().filter(new IntPredicate() {
			public boolean test(int ch) {
				return ch == 'H';
			}
		}).count();
		if (contaH > 2) {
			throw new LocomotivaException("La locomotiva non può essere presente più di due volte", sigla);
		}

		if (contaH == 2 && sigla.charAt(sigla.length() - 1) != 'H') {
			throw new LocomotivaException("La seconda locomotiva deve essere in coda", sigla);
		}

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
			case 'B':
				t.getVagoni().add(costruisciPasseggeriBusiness());
				break;
			}
		}

		t.setMarca(impostaMarca());

		return t;
	}

	protected abstract String impostaMarca();

	protected abstract Locomotiva costruisciLocomotiva();

	protected abstract Passeggeri costruisciPasseggeri();

	protected abstract PasseggeriBusiness costruisciPasseggeriBusiness();

	protected abstract Ristorante costruisciRistorante();

	protected abstract Cargo costruisciCargo();

}
