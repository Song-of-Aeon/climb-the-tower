farts++;
if farts > 60 {
	c_sakuyastep();
}

inv--;
hitboxradius = sprite_width/2*1.1;
c_basichurting();
if hp <= 0 {
	//c_zoomhold(x, y, 1.5, 4);
	instance_destroy();
}
show_debug_message(x, y);
sprite_index = s_akuya;
depth = -9;

if hp < 100 room_goto(icarus);