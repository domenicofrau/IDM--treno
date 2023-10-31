package com.idm.trenohibernate;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.idm.trenohibernate.exceptions.TrenoException;

@Component
public class ConcreteBuilder extends TrenoBuilder {

	private VagoneFactory factory;

	public ConcreteBuilder(@Qualifier("FRVagoneFactory") VagoneFactory factory) {
		this.factory = factory;
	}

	public Treno costruisciTreno(String sigla,String nome,String immagine, VagoneFactory factory)
			throws TrenoException {
		this.factory = factory;
		return super.costruisciTreno(sigla, nome,immagine);
	}

	@Override
	protected Locomotiva costruisciLocomotiva() {
		return factory.costruisciLocomotiva(TipoVagone.LOCOMOTIVA);
	}

	@Override
	protected Passeggeri costruisciPasseggeri() {
		return factory.costruisciPasseggeri(TipoVagone.PASSEGGERI);
	}

	@Override
	protected PasseggeriBusiness costruisciPasseggeriBusiness() {
		return factory.costruisciPasseggeriBusiness(TipoVagone.PASSEGGERI_BUSINESS);
	}

	@Override
	protected Ristorante costruisciRistorante() {
		return factory.costruisciRistorante(TipoVagone.RISTORANTE);
	}

	@Override
	protected Cargo costruisciCargo() {
		return factory.costruisciCargo(TipoVagone.CARGO);
	}

	@Override
	protected String impostaMarca() {
		if(factory.getClass().getSimpleName()=="FRVagoneFactory") {
			System.out.println(factory.getClass().getSimpleName());
			return "TreNord";
		}else 
			System.out.println(factory.getClass().getSimpleName());
			return "FrecciaRossa";
		} 
	}
