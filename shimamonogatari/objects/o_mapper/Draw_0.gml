/*draw_set_color(c_white);
draw_text(10, 10, object_get_name(types[selector[0]]));
var i;
switch selectedtype {
	case 0:
		draw_sprite(tl[$datas[selectedtype][selecteddata]].sprite, 0, 20, 40);
		break;
	case 1:
		//log(mp[datas[selectedtype][selecteddata]])
		draw_text(20, 40, mp[datas[selectedtype][selecteddata]].name);
		break;
}
draw_set_alpha(1);
*/

//draw_text(10, 10, object_get_name(types[selectedtype]));
draw_text(x-MIDWID+10, y-MIDHEI+10, types[selectedtype]);
var i;
for (i=0; i<array_length(datas[selectedtype]); i++) {
	draw_set_alpha(.4+(i == selecteddata && !typing)*.6);
	if (selectedtype == 1 || selectedtype == 3) && i == 0 {
		draw_text(x-MIDWID+10, y-MIDHEI+25+i*15, mp[datas[selectedtype][i][selector[selectedtype][i]]].name);
	} else {
		draw_text(x-MIDWID+10, y-MIDHEI+25+i*15, datas[selectedtype][i][
		selector[selectedtype][i]
		]);
	}
}

draw_set_alpha(.4);
for (i=-global.tilesize/2; i<room_width; i+=global.tilesize) {
	draw_line(i, 0, i, room_height);
}
for (i=-global.tilesize/2; i<room_height; i+=global.tilesize) {
	draw_line(0, i, room_width, i);
}
draw_set_alpha(1);

draw_set_halign(fa_right);
//draw_text(WIDTH-10, HEIGHT-20, st(c_tilequantizeval(mouse_x, -8)/global.tilesize+.5) + ", " + st(c_tilequantizeval(mouse_y, -8)/global.tilesize+.5));
window_set_caption(st(c_tilequantizeval(mouse_x)/global.tilesize) + ", " + st(c_tilequantizeval(mouse_y)/global.tilesize));
draw_set_halign(fa_left);