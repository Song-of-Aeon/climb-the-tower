c_input();
selectedtype = mod_negative(selectedtype+down.hit-up.hit, array_length(types));
selecteddata = mod_negative(selecteddata+right.hit-left.hit, array_length(datas));

if attack.hold {
	var dude = collision_point(c_tilequantizeval(mouse_x), c_tilequantizeval(mouse_y), types[selectedtype], false, false);
	if dude != noone {
		instance_destroy(dude);
	}
	c_maketile(mouse_x, mouse_y, tl[$datas[selecteddata]]);
	
}

if jump.hold {
	var dude = collision_point(c_tilequantizeval(mouse_x), c_tilequantizeval(mouse_y), types[selectedtype], false, false);
	if dude != noone {
		instance_destroy(dude);
	}
}