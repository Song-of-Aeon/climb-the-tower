function point_mouse(xdif=0, ydif=0, myxdif=0, myydif=0) {
	return point_direction(x+xdif, y+ydif, mouse_x+myxdif, mouse_y+myydif);
}