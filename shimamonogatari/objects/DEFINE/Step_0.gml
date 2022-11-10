repeat(c_getticks()){
	gc++;
	c_input();
	camera_set_view_pos(view_camera[0],0,0);
	state();
}
window_set_caption(st(c_tilequantizeval(x)/global.tilesize) + ", " + st(c_tilequantizeval(y)/global.tilesize));