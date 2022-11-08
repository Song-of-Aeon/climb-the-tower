weapongen({
	step: function(input) {
		if input.hit && !cooldown {
			c_bang(DEFINE.x, DEFINE.y, point_direction(DEFINE.x, DEFINE.y, mouse_x, mouse_y), 4, 0, 20, hsn.normal, c_yellow, function() {
				c
				color = make_color_hsv(40, 255-count*24, 255);
				width -= .5;
			});
			se_play(se_revolver);
			cooldown = 1.31 sec;
		}
		cooldown = floor(cooldown-1);
		if cooldown == 0 se_play(se_revclick, 1.2+random(.4));
	},
	draw: function() {
		
	},
	ammo: 0,
	ammomax: 0,
	cooldown: 1.31 sec,
	name: "revolver",
});

global.hitscans = {};
nu hitscan("normal", s_line, 5, true, false, true, 1);
