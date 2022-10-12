weapongen({
	step: function(input) {
		if input.hit && ammo {
			
			var boul = c_shoot(df.x, df.y, 9, point_direction(df.x, df.y, mouse_x, mouse_y), bul.small, c_blue, function() {
				c
				color = make_color_hsv((count*21)%255, 255, 255);
				if count >= 14 instance_destroy();
				if collision_point(x, y, o_solid, true, false) instance_destroy();
			});
			if ammo == 9 {
				rescale(boul, 4);
				boul.damage *= 2;
				c_screenshake(10, 10);
			} else {
				rescale(boul, 2);
				c_screenshake(3, 3);
			}
			ammo--;
		}
	},
	draw: function() {
		draw_text(10, 10, string(ammo)+"/"+string(ammomax));
	},
	ammo: 9,
	ammomax: 9,
	name: "nemesis",
});