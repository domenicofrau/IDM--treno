package com.idm.trenohibernate.FR;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import com.idm.trenohibernate.Cargo;
import com.idm.trenohibernate.Locomotiva;
import com.idm.trenohibernate.Passeggeri;
import com.idm.trenohibernate.PasseggeriBusiness;
import com.idm.trenohibernate.Ristorante;
import com.idm.trenohibernate.TipoMerce;
import com.idm.trenohibernate.VagoneFactory;

@Component
@Primary
public class FRVagoneFactory implements VagoneFactory {

	public Locomotiva costruisciLocomotiva() {
		return new FRLocomotiva(10, 20, 150, 1000);
	}

	public Passeggeri costruisciPasseggeri() {
		return new FRPasseggeri(18, 15, 50, 40, 4, true);
	}
	
	public PasseggeriBusiness costruisciPasseggeriBusiness() {
		return new FRPasseggeriBusiness(18, 15, 70, 24, 2, true);
	}

	public Ristorante costruisciRistorante() {
		return new FRRistorante(16, 12, 100, 10, true);
	}

	public Cargo costruisciCargo() {
		return new FRCargo(16, 8, 35, TipoMerce.MERCE_ALIMENTARE, 17);
	}

	
	

}