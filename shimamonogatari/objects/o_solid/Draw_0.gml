//surface_set_target(global.gameplay);
draw();
if instance_exists(o_mapper) {
	draw_set_color(c_white);
	draw_text(x, y, depth);
}
//draw_point(x,bbox_top-32);
//surface_reset_target();