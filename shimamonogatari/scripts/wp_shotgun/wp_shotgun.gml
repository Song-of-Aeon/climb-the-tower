weapongen({
	step: function(input, alt) {
		if input.hit && !cooldown {
			repeat(12) {
				c_shoot(df.x, df.y, 10+random(2), point_direction(df.x, df.y, mouse_x, mouse_y)+irandom(30)-15, bul.thin, c_yellow, function() {
					if collision_circle(x, y, 4, o_solid, true, false) instance_destroy();
					spd -= .5;
					if !spd instance_destroy();
				});
			}
			//c_screenbump(7, point_mouse());
			c_screenshake(7, 4);
			cooldown = 1.25 sec;
		}
		
		if alt.hold && !chargecooldown {
			charge = min(charge+1, 2 sec);
		}
		if alt.drop && !chargecooldown {
			c_shoot(df.x, df.y, charge/20, point_mouse(), bul.circle, c_red, function() {
				vspd += .1;
				if collision_circle(x, y, 4, o_solid, true, false) || collision_circle(x, y, 4, o_enemy, true, false) {
					c_screenshake(10, 8)
					c_shoot(x, y, 0, 0, bul.explosion, c_white);
					instance_destroy();
				}
			}).friendly = NaN;
			charge = 0;
			chargecooldown = 2.3 sec;
		}
		cooldown--;
		chargecooldown--;
	},
	draw: function() {
		draw_set_color(c_white);
		if cooldown draw_circle_width(df.x, df.y, cooldown/(1.25 sec)*320, 3, true);
		if chargecooldown draw_circle_width(df.x, df.y, chargecooldown/(2.3 sec)*320, 3, true);
		draw_set_color(make_color_hsv(140, 128+sinmult(gc, 20, 128), 255));
		if charge draw_circle_width(df.x, df.y, charge/2, 3, true);
	},
	name: "shotgun",
	count: 0,
	ammo: 0,
	ammomax: 0,
	cooldown: 0,
	charge: 0,
	chargecooldown: 0,
});

nu bullet("explosion", s_bulbig, 1, false, true, 1, function() {
	log("hi")
	iterations++;
	rescale(id, 3);
	color = make_color_hsv(40-iterations*2, 255, 255);
	alpha = 1-iterations*.02;
	if alpha <= 0 instance_destroy();
	c_flatcolor();
});