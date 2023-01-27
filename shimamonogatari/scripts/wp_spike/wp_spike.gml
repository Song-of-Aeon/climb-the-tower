weapongen({
	step: function(input, alt) {
		dude = distabs(point_mouse(), 12-recoil);
		if input.hold && !cooldown {
			var bang = c_bang(x, y, point_mouse(u, u, u, u, self), 4, 0, 20, hsn.spike, c_yellow, function() {
				c
				color = make_color_hsv(40, 255-count*24, 255);
				width -= .5;
			});
			bang.damage = 5;
			bang.size = 120;
			se_play(se_revolver);
			cooldown = 1.31 sec;
			charge = 0;
			recoil = 6;
		}
		cooldown = floor(cooldown-1);
		if cooldown == 0 se_play(se_revclick, 1.2+random(.4));
		coins = min(coins+1/3/60, 4);
		if alt.hit && coins {
			
		}
		recoil = lerp(recoil, 0, .05);
	},
	draw: function() {
		draw_set_color(c_white);
		if cooldown draw_circle_width(df.x, df.y, cooldown/(1.31 sec)*320, 3, true);
		draw_set_color(c_black);
		if chargecooldown draw_circle_width(df.x, df.y, chargecooldown/(5.25 sec)*320, 3, true);
		draw_set_color(make_color_hsv(140, 128+sinmult(gc, 20, 128), 255));
		if charge draw_circle_width(df.x, df.y, charge/2, 3, true);
	},
	coins: 0,
	chargeshot: 0,
	ammo: 0,
	ammomax: 0,
	cooldown: 0,
	recoil: 0,
	charge: 0,
	chargecooldown: 0,
	name: "spike",
	dude: new vec2(),
	sprite: s_polarstar,
});
nu hitscan("spike", s_line, 99, false, true, 1);
