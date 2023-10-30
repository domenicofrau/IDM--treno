package com.idm.trenohibernate;

public interface VagoneFactory {

	public Locomotiva costruisciLocomotiva(TipoVagone tipo);

	public Passeggeri costruisciPasseggeri(TipoVagone tipo);

	public PasseggeriBusiness costruisciPasseggeriBusiness(TipoVagone tipo);

	public Ristorante costruisciRistorante(TipoVagone tipo);

	public Cargo costruisciCargo(TipoVagone tipo);

}