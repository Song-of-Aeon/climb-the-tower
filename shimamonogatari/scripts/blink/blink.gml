function blink(event) {
	var chump = scriptable_create(function() {
		count += itneg();
		if count == 8 {
			event();
			iterations++;
		}
		if count == 16 kys;
	}, function() {
		draw_set_color(c_black);
		draw_rectangle(0, 0, WIDTH, HEIGHT*count/16, false);
		draw_rectangle(0, HEIGHT, WIDTH, HEIGHT-HEIGHT*count/16, false);
	});
	chump.event = event;
	return chump;
}