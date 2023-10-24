package com.idm.trenohibernate;

public interface VagoneFactory {

	public Locomotiva costruisciLocomotiva();

	public Passeggeri costruisciPasseggeri();

	public Ristorante costruisciRistorante();

	public Cargo costruisciCargo();

}