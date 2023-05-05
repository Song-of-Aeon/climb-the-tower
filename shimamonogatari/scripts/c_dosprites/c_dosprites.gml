function c_dosprites() {
	if aerial {
		image_speed = 0;
		image_index = 1;
		if down.hold image_index = sprites.down;
		if hput != 0 {
			image_xscale = -hput;
		}
		image_index = slamming ? 2 : !spd.v+1;
	} else {
		if hput != 0 {
			image_xscale = -hput;
			image_speed = spd.h/20;
		} else {
			image_index = 0;
			image_speed = 0;
		}
	}
}

function c_dospritesnotv1() {
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

function c_dospriteslily() {
	if !aerial {
		sprite_index = sprites.idle;
		if hput != 0 {
			image_xscale = -hput;
			sprite_index = sprites.walk;
			image_speed = spd.h/6;
		} else {
			image_speed = .3;
		}
	} else {
		if hput != 0 {
			image_xscale = -hput;
		}
		sprite_index = sprites.jump;
		image_index = clamp((spd.v+jumpspeed)*2, 0, sprite_get_info(sprites.jump).num_subimages-1);
	}
}

function c_dospritesky() {
	if hput != 0 {
		image_xscale = -hput;
	}
	image_speed = 0;
}