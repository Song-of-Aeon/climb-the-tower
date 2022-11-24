step();

inv--;
hitboxradius = sprite_width/2*1.1;
c_basichurting();
if hp <= 0 {
	//c_zoomhold(x, y, 1.5, 4);
	instance_destroy();
}