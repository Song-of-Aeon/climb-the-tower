for (currentbehavior=0; currentbehavior<array_length(draws); currentbehavior++) {
	var scr = draws[currentbehavior];
	scr();
}

//draw_outline(draw_self);
image_angle = direction-90;
//image_angle = point_direction(xprevious, yprevious, x, y)-90;
//
image_yscale = (1000)/sprite_get_height(sprite_index);
if delay {
	var wid = width/3;
	image_xscale = (wid)/sprite_get_width(sprite_index);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha/3);
	draw_sprite_ext(colorcover, image_index, x, y, image_xscale, image_yscale, image_angle, color, image_alpha/3);
} else {
	var wid = width;
	image_xscale = (wid)/sprite_get_width(sprite_index);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(colorcover, image_index, x, y, image_xscale, image_yscale, image_angle, color, image_alpha);
	
}




//draw_sprite_general(sprite_index, image_index, 0, 0, sprite_get_width(sprite_index)*image_xscale, sprite_get_height(sprite_index)*image_yscale, x, y, image_xscale, image_yscale, image_angle, image_blend, image_blend, image_blend, image_blend, image_alpha);
//draw_sprite_general(colorcover, image_index, 0, 0, sprite_get_width(sprite_index)*image_xscale, sprite_get_height(sprite_index)*image_yscale, x, y, image_xscale, image_yscale, image_angle, color, color, color, color, image_alpha);
//draw_sprite_general(sprite_index, image_index, 0, endtime*2, sprite_get_width(sprite_index)*width, sprite_get_height(sprite_index)*length, x, y, image_xscale, image_yscale, image_angle, c_white, c_white, c_white, c_white, image_alpha);
//draw_sprite_general()

//draw_set_color(c_red);
//draw_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
//draw_set_color(c_white);
//image_alpha = .1;
//draw_line_width(x, y, endx, endy, width);

//draw_collision_line_width(x, y, x+hspd*1000, y+vspd*1000, 300, wid, ISAAC);

//collision_line_width(x, y, endx, endy, length*3, width, ISAAC);

//draw_text(50+irandom(20), 50+irandom(20), string(duration));