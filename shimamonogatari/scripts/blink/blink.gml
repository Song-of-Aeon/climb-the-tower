function blink(event) {
	var chump = scriptable_create(function() {
		count += itneg();
		if count == 6 {
			event();
			iterations++;
		}
		if count == -1 kys;
	}, function() {
		surface_set_target(global.surfaces.HUD);
			draw_set_color(c_black);
			draw_rectangle(0, 0, WIDTH, HEIGHT*count/12, false);
			draw_rectangle(0, HEIGHT, WIDTH, HEIGHT-HEIGHT*count/12, false);
		surface_reset_target();
	});
	chump.event = event;
	return chump;
}