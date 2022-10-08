c_input();
selectedtype = mod_negative(selectedtype+down.hit-up.hit, array_length(types));

if attack.hold {
	var dude = collision_point(c_tilequantizeval(mouse_x), c_tilequantizeval(mouse_y), types[selectedtype], false, false);
	if dude != noone {
		instance_destroy(dude);
	}
	var chump = instance_create(mouse_x, mouse_y, o_solid);
	c_tilequantize(chump);
}

if jump.hold {
	var dude = collision_point(c_tilequantizeval(mouse_x), c_tilequantizeval(mouse_y), types[selectedtype], false, false);
	if dude != noone {
		instance_destroy(dude);
	}
}