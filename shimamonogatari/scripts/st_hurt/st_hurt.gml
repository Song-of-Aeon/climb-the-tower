function st_hurt() {
	var returnable = false;
	if !inv {
		takingdamage = ow.damage;
		if takingdamage > hp {
			state = st_deathbomb;
			takingtype = ow.type;
		} else {
			if !c_dohook(hooks.onhit, id, ow) {
				var osdhufji = max(takingdamage-defense, 1);
				STATS.damagetaken += osdhufji;
				se_play(snd_hurt);
				hp -= osdhufji;
				c_inv(invtime);
				c_screenshake(osdhufji, inv/2);
			}
		}
		returnable = true;
	}
	if ow.destructible {
		instance_destroy(ow);
	}
	return returnable;
}