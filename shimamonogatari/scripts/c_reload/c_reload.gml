function c_reload() {
	var i;
	var refilled = 0;
	/*loopmode = {
		playbackSpeed: .5,
	};*/
	for (i=0; i<array_length(df.weapons); i++) {
		refilled += abs(df.weapons[i].ammo-df.weapons[i].ammomax);
		df.weapons[i].ammo = df.weapons[i].ammomax;
	}
	return refilled;
}