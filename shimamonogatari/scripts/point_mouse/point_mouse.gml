function point_mouse(xdif=0, ydif=0, myxdif=0, myydif=0, target=df) {
	return point_direction(target.x+xdif, target.y+ydif, mouse_x+myxdif, mouse_y+myydif);
}