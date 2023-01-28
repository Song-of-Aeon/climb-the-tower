//surface_set_target(global.gameplay);
image_blend = make_color_hsv(0, 0, value);
//log(draw);
if(!surface_exists(bloodOverlay))
	setBloodOverlay();
draw();
draw_surface(bloodOverlay,x-8,y-8);
if instance_exists(o_mapper) {
	draw_set_color(c_white);
	draw_text(x, y, depth);
}
//draw_point(x,bbox_top-32);
//surface_reset_target();