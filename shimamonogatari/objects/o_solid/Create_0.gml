type = tl[5][0];
step = c_null;
draw = draw_self;
hp = infinity;
hitboxradius = 8;
inv = false;
defense = 0;
image_speed = 0;

value = 256;

function setBloodOverlay(){
	bloodOverlay = surface_create(16,16);
	surface_set_target(bloodOverlay)
		draw_clear_alpha(c_black,0.5)
	surface_reset_target()
}

setBloodOverlay();