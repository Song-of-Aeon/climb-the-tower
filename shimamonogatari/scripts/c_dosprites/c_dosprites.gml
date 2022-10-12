function c_dosprites() {
	if aerial {
		image_speed = 0;
		sprite_index = up.hold ? sprites.upwalk : sprites.walk;
		if down.hold image_index = sprites.down;
		if hput != 0 {
			image_xscale = -hput;
		}
		image_index = !spd.v;
	} else {
		if hput != 0 {
			image_xscale = -hput;
			sprite_index = up.hold ? sprites.upwalk : sprites.walk;
			image_speed = spd.h/6;
		} else {
			sprite_index = up.hold ? sprites.up : sprites.idle;
		}
	}
}