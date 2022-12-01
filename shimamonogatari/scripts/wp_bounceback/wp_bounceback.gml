weapongen({
	step: function(input, alt) {
		if input.hit && !normalcooldown-- {
			var boul = c_shoot(x, y, 5, point_mouse(), bul.bounceback, c_green, function() {
				if place_meeting(x, y, o_solid) instance_destroy();
				delay--;
			});
			boul.delay = 0;
			tag("bounceshots", boul);
			normalcooldown = 72;
		}
		if alt.hit && array_length(tag_get_instances("bounceshots")) && !specialcooldown-- {
			var boul = c_shoot(x, y, 8, point_mouse(), bul.swap, c_black, function() {
				if place_meeting(x, y, o_solid) instance_destroy();
			});
		}
	},
	draw: function() {
		
	},
	ammo: 0,
	ammomax: 0,
	name: "bounceback",
	sprite: s_polarstar,
	normalcooldown: 0,
	specialcooldown: 0,
});

nu bullet("bounceback", s_bulbig, 6, false, true, 1, u, u, u, function() {
	if !ow.delay {
		method(id, st_hurt)();
		ow.dir += 180;
		ow.delay = 4;
	}
});