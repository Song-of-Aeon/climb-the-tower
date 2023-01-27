function st_dcdraw() {
	c_drawinput();
	weapons[eqwp][altpos].step(attack, alt);
	weapons[eqwp][altpos].draw();
	st_dcdrawui();
	ang = point_mouse();
	image_xscale = -ineg(ang >= 90 && ang <= 270);
	ang = point_mouse();
	dude = distabs_ext(ang, 9, 1, 1);
	draw_sprite_ext(
		weapons[eqwp][altpos].sprite, 0,
		df.x-2*image_xscale+dude.x, df.y-3+dude.y, 1,
		ineg(ang >= 90 && ang <= 270), ang, c_white, 1
	);
	weapons[eqwp][altpos].x = df.x-2*image_xscale+dude.x;
	weapons[eqwp][altpos].y = df.y-3+dude.y;
	var ang = point_mouse();
	var theflip = ineg(ang >= 90 && ang <= 270);
	draw_sprite_ext(s_dcgunarm, 2, x-2*image_xscale, y-4, theflip, image_yscale, point_mouse()+90, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	
	
	arm[eqarm].draw();
	//draw_sprite_ext(s_dcthing, 0, x, y-4, -image_xscale, image_yscale, -spd.h*11, c_white, 1);
	draw_sprite_ext(s_dcthing, 0, x, y-4, -image_xscale, image_yscale, 0, c_white, 1);
	faceangle = lerp_angle(faceangle, ang, .15);
	draw_sprite_ext(s_dcface, 0, x, y-8, 1, ineg(ang >= 90 && ang <= 270), faceangle, c_white, 1);
	var dude = distabs(point_mouse(), 100);
	if attack.hit log(point_mouse(), x, y, mouse_x, mouse_y);
	//draw_line_width(x, y, x+dude.x, y+dude.y, 2);
}