package com.idm.trenohibernate;

import java.util.function.IntPredicate;
import com.idm.trenohibernate.exceptions.*;
import com.idm.trenohibernate.service.TrenoService;
import com.idm.trenohibernate.service.UtenteService;
import com.idm.trenohibernate.service.VagoneService;
public abstract class TrenoBuilder {
	
	TrenoService tService = new TrenoService();
	UtenteService uService= new UtenteService();
	VagoneService vService = new VagoneService();
	public Treno costruisciTreno(String sigla, String nome, String immagine, String regione) throws TrenoException {

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
		if (sigla.contains("B") && !sigla.contains("R")) {
			throw new RistoranteException("Se è presente un vagone passeggeri business, è obbligatorio un vagone ristorante",
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
		
		if(tService.findByName(nome)!=null) {
			throw new TrenoNameException("Nome del treno già esistente", nome);
		}

		Treno t = new Treno();
		int peso = 0;
		int pesoMassimo = 0;
		int countPasseggeri = 0;
		int countVagoniBusiness = 0;
		int countRistorante = 0;
		int countCargo = 0;
		int prezzoTotale = 0;
		
		for (int i = 0; i < sigla.length(); i++) {

			char c = sigla.charAt(i);

			switch (c) {
			case 'H':

				t.getVagoni().add(costruisciLocomotiva());
				pesoMassimo = costruisciLocomotiva().getPesoTrainabile();
				peso += 20;
				prezzoTotale += costruisciLocomotiva().getPrezzo();
				break;
			case 'P':
				t.getVagoni().add(costruisciPasseggeri());
				peso += 18;
				prezzoTotale += costruisciPasseggeri().getPrezzo();
				countPasseggeri++;
				break;
			case 'R':
				t.getVagoni().add(costruisciRistorante());
				peso += 12;
				countRistorante++;
				prezzoTotale += costruisciRistorante().getPrezzo();
				break;
			case 'C':
				t.getVagoni().add(costruisciCargo());
				int pesoMerce = costruisciCargo().getPesoTotale();
				peso += pesoMerce;
				countCargo++;
				prezzoTotale += costruisciCargo().getPrezzo();
				break;
			case 'B':
				t.getVagoni().add(costruisciPasseggeriBusiness());
				peso += 15;
				countVagoniBusiness++;
				prezzoTotale += costruisciPasseggeriBusiness().getPrezzo();
				break;
			}

		}
		int pesoDaTogliere = peso - pesoMassimo;
		String consiglio = generaConsiglio(countPasseggeri, countVagoniBusiness, countRistorante, countCargo,
				pesoDaTogliere);
		if (peso > pesoMassimo) {
			
			throw new MaxWeightException("Peso massimo raggiunto, elimina qualche vagone. Il peso massimo è "
					+ pesoMassimo + ", " + "il tuo peso corrente è " + peso + "." + consiglio, sigla);
		}

		t.setMarca(impostaMarca());
		t.setNome(nome);
		t.setImmagine(immagine);
		t.setRegione(regione);
		t.setPrezzoTotale(prezzoTotale);
		t.setInVendita(false);

		return t;
	}

	private String generaConsiglio(int countPasseggeri, int countVagoniBusiness, int countRistorante, int countCargo,
			int pesoDaTogliere) {
		int contaVagoniPasseggeri = 0;
		int contaVagoniBusiness = 0;
		int contoP = countPasseggeri;
		int contoPB = countVagoniBusiness;

		int contaCargo = countCargo;
		int pesoDaLevare = pesoDaTogliere;
		String message = null;
		if (countCargo > 0) {
			contaCargo = pesoDaLevare / (countCargo * 17);

			message = "prova a levare " + contaCargo + " vagoni cargo ";
		} else
			while (pesoDaLevare > 0) {
				if (contoP > contoPB) {
					pesoDaLevare -= 18;
					contaVagoniPasseggeri++;
					contoP--;
				}

				else if (contoPB > contoP) {
					pesoDaLevare -= 18;
					contaVagoniBusiness++;
					contoPB--;
				} else {
					pesoDaLevare -= 18;
					contaVagoniPasseggeri++;
					contoP--;
					pesoDaLevare -= 18;
					contaVagoniBusiness++;
					contoPB--;
				}
				message = " Prova a levare " + contaVagoniPasseggeri + " vagoni passeggeri " + "e "
						+ contaVagoniBusiness + " Vagoni business";
			}
		return message;
	}
	
	public Treno addVagonePasseggeri(Treno treno) throws TrenoException, UtenteException {
		Treno t = tService.find(treno.getId());
		Utente u=t.getUtente();
		Vagone v = costruisciPasseggeri();
		
		int prezzo= v.getPrezzo();
		int pesoVagone = v.getPeso();
		int pesoMassimo = costruisciLocomotiva().getPesoTrainabile();
		int pesoAttuale=t.getPeso();
		int pesoTotale=pesoAttuale+pesoVagone;
		
		if(pesoTotale>pesoMassimo) {
			throw new MaxWeightException("Peso massimo raggiunto. Il peso massimo è: "
					+ pesoMassimo + ", " + "il tuo peso con l`aggiunzione del vagone passeggeri sarebbe: " + pesoTotale + "." , "fallito");
		
		}
		else
		if(u.getbitTrain()-prezzo<0) {
			throw new SaldoNonSufficenteException("Saldo non sufficente");
		}else
		u.setbitTrain(u.getbitTrain()-prezzo);
		vService.aggiungiVagone(v, t);
		uService.update(u);
		
		return t;
	}
	public Treno addVagonePasseggeriBusiness(Treno treno) throws TrenoException, UtenteException {
		Treno t = tService.find(treno.getId());
		Utente u=t.getUtente();
		Vagone v = costruisciPasseggeriBusiness();
		
		int prezzo= v.getPrezzo();
		int pesoVagone = v.getPeso();
		int pesoMassimo = costruisciLocomotiva().getPesoTrainabile();
		int pesoAttuale=t.getPeso();
		int pesoTotale=pesoAttuale+pesoVagone;
		
		if(pesoTotale>pesoMassimo) {
			throw new MaxWeightException("Peso massimo raggiunto. Il peso massimo è: "
					+ pesoMassimo + ", " + "il tuo peso con l`aggiunzione del vagone passeggeri sarebbe: " + pesoTotale + "." , "fallito");
			
		}
		else
			if(u.getbitTrain()-prezzo<0) {
				throw new SaldoNonSufficenteException("Saldo non sufficente");
			}else
				u.setbitTrain(u.getbitTrain()-prezzo);
		vService.aggiungiVagone(v, t);
		uService.update(u);
		return t;
	}
	public Treno addVagoneLocomotiva(Treno treno) throws TrenoException, UtenteException {
		Treno t = tService.find(treno.getId());
		Utente u=t.getUtente();
		Vagone v = costruisciLocomotiva();
		
		int prezzo= v.getPrezzo();
		int pesoVagone = v.getPeso();
		int pesoMassimo = costruisciLocomotiva().getPesoTrainabile();
		int pesoAttuale=t.getPeso();
		int pesoTotale=pesoAttuale+pesoVagone;
		
		if(pesoTotale>pesoMassimo) {
			throw new MaxWeightException("Peso massimo raggiunto. Il peso massimo è: "
					+ pesoMassimo + ", " + "il tuo peso con l`aggiunzione del vagone passeggeri sarebbe: " + pesoTotale + "." , "fallito");
			
		}
		else
			if(u.getbitTrain()-prezzo<0) {
				throw new SaldoNonSufficenteException("Saldo non sufficente");
			}else
				u.setbitTrain(u.getbitTrain()-prezzo);
		vService.aggiungiVagone(v, t);
		uService.update(u);
		t.toString();
		return t;
	}
	public Treno addVagoneRistorante(Treno treno) throws TrenoException, UtenteException {
		Treno t = tService.find(treno.getId());
		Utente u=t.getUtente();
		Vagone v = costruisciRistorante();
		
		int prezzo= v.getPrezzo();
		int pesoVagone = v.getPeso();
		int pesoMassimo = costruisciLocomotiva().getPesoTrainabile();
		int pesoAttuale=t.getPeso();
		int pesoTotale=pesoAttuale+pesoVagone;
		
		if(pesoTotale>pesoMassimo) {
			throw new MaxWeightException("Peso massimo raggiunto. Il peso massimo è: "
					+ pesoMassimo + ", " + "il tuo peso con l`aggiunzione del vagone passeggeri sarebbe: " + pesoTotale + "." , "fallito");
			
		}
		else
			if(u.getbitTrain()-prezzo<0) {
				throw new SaldoNonSufficenteException("Saldo non sufficente");
			}else
				u.setbitTrain(u.getbitTrain()-prezzo);
		vService.aggiungiVagone(v, t);
		uService.update(u);
		return t;
	}
	public Treno addVagoneCargo(Treno treno) throws TrenoException, UtenteException {
		Treno t = tService.find(treno.getId());
		Utente u=t.getUtente();
		Vagone v = costruisciCargo();
		
		int prezzo= v.getPrezzo();
		int pesoVagone = v.getPeso();
		int pesoMassimo = costruisciLocomotiva().getPesoTrainabile();
		int pesoAttuale=t.getPeso();
		int pesoTotale=pesoAttuale+pesoVagone;
		
		if(pesoTotale>pesoMassimo) {
			throw new MaxWeightException("Peso massimo raggiunto. Il peso massimo è: "
					+ pesoMassimo + ", " + "il tuo peso con l`aggiunzione del vagone passeggeri sarebbe: " + pesoTotale + "." , "fallito");
			
		}
		else
			if(u.getbitTrain()-prezzo<0) {
				throw new SaldoNonSufficenteException("Saldo non sufficente");
			}else
				u.setbitTrain(u.getbitTrain()-prezzo);
		vService.aggiungiVagone(v, t);
		uService.update(u);

		return t;
	}

	protected abstract String impostaMarca();

	protected abstract Locomotiva costruisciLocomotiva();

	protected abstract Passeggeri costruisciPasseggeri();

	protected abstract PasseggeriBusiness costruisciPasseggeriBusiness();

	protected abstract Ristorante costruisciRistorante();

	protected abstract Cargo costruisciCargo();

}
