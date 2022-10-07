weapongen({
	step: function(input) {
		if input.hit {
			c_shoot(df.x, df.y, 9, point_direction(df.x, df.y, mouse_x, mouse_y), bul.big, c_blue);
		}
	},
	name: "nemesis",
});