function st_v1() {
    //log(jump);
	//log(weapons[eqwp]);
	weapons[eqwp][altpos].step(attack, alt);
	
	if debug.hit {
		//textbox_create(txt_kotohime);
		c_spawnenemy(10 tiles, 10 tiles, en.filth);
	}
	//log(wep);
	iterate wep to {
		if wep[i].hit && array_length(weapons) >= i {
			if eqwp != i {
				eqwp = i;
				log("equipped");
				altpos = 0;
			} else {
				altpos = cycle(altpos+1, array_length(weapons[eqwp]));
				log("alted");
			}
		}
	}
	if altwep.hit altpos = cycle(altpos+1, array_length(weapons[eqwp]));
	
	if punch.hit {
		var parryrange = 8;
		var dude = distabs(point_mouse(), 8);
		var boul = collision_circle(x+dude.x, y+dude.y, 8, o_bullet, true, false);
		if boul && boul.object_index != o_hitscan {
			scriptable_create(u, function() {
				draw_set_color(c_white);
				draw_set_alpha(.25);
				draw_rectangle(0, 0, room_width, room_height, false);
				draw_set_alpha(1);
				if count {
					c_hitpause(220);
					instance_destroy();
				}
				c
			});
			c_shoot(x, y, 11, point_mouse(), bul.circle, c_yellow, function() {
				if collision_circle(x, y, 4, o_solid, true, false) || collision_circle(x, y, 4, o_enemy, true, false) {
					c_shoot(x, y, 0, 0, bul.explosion, c_white);
					instance_destroy();
				}
			}, c_flatcolor).friendly = NaN;
			instance_destroy(boul);
		}
	}
	
	//log(eqwp);
	
	/*if wp2.hit && array_length(weapons) < 6 {
			eqwp = 1;
			log("equipped");
	}*/
	
	
	if left.hold dir = 180;
	if right.hold dir = 0;
	if down.hold dir = 270;
	if up.hold dir = 90;
	
	
    hput = right.hold-left.hold;
    vput = down.hold-up.hold;
	
	c_dosprites();
	
	if reload.hit && magazines {
		se_play(se_toss);
		magazines--;
		var chump = instance_create(x, y, o_magazine);
		chump.spd.h = spd.h*1.4;
		//chump.spd.h = mouse_x < x ? -1 : 1;
		chump.spd.v = -3;
	}
    spd.h = lerp(spd.h, hput*walkspeed, .1);
    var a = {bbox_left: bbox_left+2,
        bbox_top:bbox_top+grav,
        bbox_right: bbox_right-2,
        bbox_bottom:bbox_bottom+grav}
    var ymeeting = bread_collision(a,o_solid,COLTYPE.LESSTHANEQUALTO);
    if !ymeeting {
        spd.v += grav;
        leniance--;
        aerial = true;
    } else {
        leniance = lencount;
        if aerial {
            aerial = false;
        }
        spd.v = 0;
    }
    if leniance > 0 {
        if (jump.hit) {
            spd.v = -jumpspeed;
            leniance = 0;
        }
    }
    if spd.v < 0 {
        if (jump.drop) {
            spd.v /= 2;
        }
    }
    c_newcollision();
    x += spd.h;
    y += spd.v;
	
	var dude = collision_point(x, y, o_entity, false, false);
	if dude && !aerial && down.hit {
		if dude.interactable {
			dude.interaction();
		}
	}
	if inventory.hit {
		instance_create(0, 0, o_inventory);
		c_settimescale(0);
	}
}