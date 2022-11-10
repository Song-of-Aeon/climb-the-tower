weapongen({
	step: function(input) {
		if input.hit && !cooldown {
			repeat(12) {
				c_shoot(df.x, df.y, 10+random(2), point_direction(df.x, df.y, mouse_x, mouse_y)+irandom(30)-15, bul.thin, c_yellow, function() {
					spd -= .5;
					if !spd instance_destroy();
				});
			}
			//c_screenbump(7, point_mouse());
			c_screenshake(7, 4);
			cooldown = 1.25 sec;
		}
		cooldown--;
	},
	draw: function() {
		draw_set_color(c_white);
		if cooldown draw_circle_width(df.x, df.y, cooldown/(1.25 sec)*320, 3, true);
	},
	name: "shotgun",
	count: 0,
	ammo: 0,
	ammomax: 0,
	cooldown: 0,
});