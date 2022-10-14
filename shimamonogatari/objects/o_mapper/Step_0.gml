c_input();

















//selectedtype = mod_negative(selectedtype+down.hit-up.hit, array_length(types));

//selecteddata = mod_negative(selecteddata+right.hit-left.hit, array_length(datas[selectedtype]));
/*selectionzone = mod_negative(selectionzone+down.hit-up.hit, array_length(datas[0][selector[0]]));
selector[selectionzone] = mod_negative(selector[selectionzone]+right.hit-left.hit, array_length(datas[selector[0]]))

switch selector[0] {
	case o_solid:
		//datas[]
}
*/

if jump.hold {
	roomsize.x = selector[2][0] tiles;
	roomsize.y = selector[2][1] tiles;
	x = clamp(x+(mouse_x-mousepos.x)/2, 160, roomsize.x-160);
	y = clamp(y+(mouse_y-mousepos.y)/2, 120, roomsize.y-120);
	mousepos.x = mouse_x;
	mousepos.y = mouse_y;
	//x += 2;
}

if !typing {
	switch selectedtype {
		case 0:
			if attack.hold {
				var dude = collision_point(c_tilequantizeval(mouse_x), c_tilequantizeval(mouse_y), o_solid, false, false);
				if dude != noone {
					instance_destroy(dude);
				}
				var chump = c_maketile(mouse_x, mouse_y, tl[$datas[selectedtype][selecteddata][selector[selectedtype][selecteddata]]]);
				log(chump.type);
				array_push(guys, chump);
	
			}
			if inventory.hold {
				var dude = collision_point(c_tilequantizeval(mouse_x), c_tilequantizeval(mouse_y), o_solid, false, false);
				if dude != noone {
					instance_destroy(dude);
				}
			}
			break;
		case 1:
			if attack.hit {
				//mydude = instance_create(mouse_x, mouse_y, o_trigger);
				mydude = c_maketrigger(mouse_x, mouse_y, mouse_x, mouse_y);
				mydude.target = mp[datas[selectedtype][0][selector[selectedtype][0]]].maproom;
				mydude.targetx = datas[selectedtype][1][selector[selectedtype][1]] tiles;
				mydude.targety = datas[selectedtype][2][selector[selectedtype][2]] tiles;
				c_tilequantize(mydude, -8, -8);
				array_push(guys, mydude);
			}
			if attack.hold {
				mydude.x2 = c_tilequantizeval(mouse_x, -8);
				mydude.y2 = c_tilequantizeval(mouse_y, -8);
			}
			if inventory.hold {
				var dude = collision_point(c_tilequantizeval(mouse_x, -8), c_tilequantizeval(mouse_y, -8), o_trigger, false, false);
				if dude != noone {
					instance_destroy(dude);
				}
			}
			break;
		case 3:
			if attack.hit {
				room_goto(mp[datas[selectedtype][0][selector[selectedtype][0]]].maproom);
				selector[2][0] = room_width/(1 tiles);
				selector[2][1] = room_height/(1 tiles);
				x = 160;
				y = 120;
				typing = !typing;
				instance_destroy(DEFINE);
			}
			break;
		case 4:
			room_goto(mp[sky_corridor].maproom);
			instance_destroy();
			break;
	}

	if debug.hit {
		/*c_saveroom(get_string("", ""));
		log("did it");*/
		
	}
}

if undo {
	instance_destroy(array_pop(guys));
}


if reload.hit {
	typing = !typing;
}

if typing {
	selectedtype = mod_negative(selectedtype+right.hit-left.hit, array_length(types));
} else {
	selecteddata = mod_negative(selecteddata+down.hit-up.hit, array_length(datas[selectedtype]));
	selector[selectedtype][selecteddata] = mod_negative(
		selector[selectedtype][selecteddata]+(right.hit-left.hit)*(1+shift.hold*4),
		array_length(datas[selectedtype][selecteddata])
	);
}