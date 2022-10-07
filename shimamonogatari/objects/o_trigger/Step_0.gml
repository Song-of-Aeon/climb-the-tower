step();
if collision_rectangle(x, y, x2, y2, DEFINE, true, false) {
	if !active enter();
	active = true;
	stay();
} else {
	if active leave();
	active = false;
}