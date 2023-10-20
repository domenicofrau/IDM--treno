package com.idm.trenohibernate;

public interface VagoneFactory {

	public Vagone costruisciLocomotiva();

	public Vagone costruisciPasseggeri();

	public Vagone costruisciRistorante();

	public Vagone costruisciCargo();

}