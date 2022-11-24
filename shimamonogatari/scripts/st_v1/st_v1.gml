function st_v1() {
    //log(jump);
	//log(weapons[eqwp]);
	
	//if down.hold dir = 270;
	//if up.hold dir = 90;
	if left.hold dir = 180;
	if right.hold dir = 0;
	
	
	
    hput = right.hold-left.hold;
    vput = down.hold-up.hold;
	
	inv--;
	if !sliding stamina = min(stamina+.014, 3);
	punchdelay--;
	
	weapons[eqwp][altpos].step(attack, alt);
	
	if debug.hit {
		//textbox_create(txt_kotohime);
		//c_spawnenemy(10 tiles, 10 tiles, en.filth);
		repeat(5) {
			c_spawnenemy((irandom(14)+3) tiles, (irandom(3)+3) tiles, en.filth);
		}
		repeat(5) {
			c_spawnenemy((irandom(14)+3) tiles, (irandom(3)+3) tiles, en.stray);
		}
	}
	if !--cameradelay {
		camera_set_view_size(view_camera[0],
			min(camera_get_view_width(view_camera[0])*1.03, 320),
			min(camera_get_view_height(view_camera[0])*1.03, 240),
		);
	}
	//camera_set_view_pos(view_camera[0], cameratarg.x, cameratarg.y);
	camera_set_view_target(view_camera[0], id);
	
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
	
	if punch.hit && !punchdelay {
		punchdelay = 40;
		var parryrange = 8;
		var dude = distabs(point_mouse(), 8);
		c_shoot(x+dude.x, y+dude.y, 0, point_mouse(), bul.square, c_blue, function() {
			var boul = collision_circle(x, y, 8, o_bullet, true, true);
			if boul && boul.object_index != o_hitscan {
				df.punchdelay = 0;
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
				kys
			}
			if count > 3 kys
			c;
		}).damage = 3;
	}
	
	
	if dash.hit && stamina >= 1 {
		slamming = false;
		sliding = false;
		if hput == 0 {
			if point_mouse() < 270 && dir == 180 dashing = -1 else dashing = 1;
		} else {
			dashing = hput;
		}
		dashing *= 8;
		stamina--;
		spd.v = 0;
	}
	
	if aerial {
		if slam.hit {
			slamming = true;
			spd.v = 5.5;
			spd.h = 0;
			dashing = false;
		}
	} else {
		if slam.hit {
			if hput == 0 {
				if point_mouse() < 270 && dir == 180 sliding = -2.4 else sliding = 2.4;
			} else {
				sliding = hput*2.4//*(slamduration/60+1);
			}
		}
		if slam.drop {
			sliding = false;
		}
		aerial--;
		if aerial < -30 {
			slamduration = 0;
		}
	}
	if dashing != 0 inv = true;
	
	if sliding != 0 {
		spd.h = sliding+hput*.6;
	} else if dashing != 0 {
		spd.h = sign(dashing)*6;
		dashing -= sign(dashing);
		if dashing == 0 {
			spd.h = hput*walkspeed;
		}
	} else /*if !slamming*/ {
		if abs(spd.h) > abs(walkspeed) && aerial && false {
			if abs(spd.h) < abs(spd.h+hput) {
				lerp(spd.h, hput*walkspeed, .1);
			}
		} else {
			spd.h = lerp(spd.h, hput*walkspeed, .1);
		}
	}
	
	if slamming {
		slamduration = min(slamduration+1, 100);
	}
	
	//log(eqwp);
	
	/*if wp2.hit && array_length(weapons) < 6 {
			eqwp = 1;
			log("equipped");
	}*/
	
	
	
	
	c_dosprites();
	
	if reload.hit && magazines {
		se_play(se_toss);
		magazines--;
		var chump = instance_create(x, y, o_magazine);
		chump.spd.h = spd.h*1.4;
		//chump.spd.h = mouse_x < x ? -1 : 1;
		chump.spd.v = -3;
	}
    
    var a = {
		bbox_left: bbox_left+2,
        bbox_top: bbox_top+grav,
        bbox_right: bbox_right-2,
        bbox_bottom: bbox_bottom+grav
	}
    var ymeeting = bread_collision(a,o_solid,COLTYPE.LESSTHANEQUALTO);
    if !ymeeting {
		if dashing == 0 {
	        spd.v += grav;
	        leniance--;
		}
        aerial = true;
    } else {
        leniance = lencount;
        if aerial {
            aerial = false;
        }
		if slamming {
			slamming = false;
			//c_zoomhold(x, y, 2, 20);
			c_shoot(x, y, 0, 0, bul.explosion);
			if slamduration < 60 slamduration = min(slamduration, 20);
		}
        spd.v = 0;
		walljumps = 3;
    }
    if leniance > 0 && jump.hit {
        spd.v = -(jumpspeed+slamduration/10);
		log(slamduration/10);
		slamduration = 0;
        leniance = 0;
		sliding = false;
		if dashing != 0 {
			dashing = false;
			spd.v *= .75;
		}
    }
    if spd.v < 0 {
        if (jump.drop) {
            spd.v /= 2;
        }
    }
    var xmeeting = c_widecollision(2);
	//log(slamduration);
	if xmeeting {
		if aerial && walljumps && jump.hit {
			walljumps--;
			spd.v = -jumpspeed;
			if xmeeting == 1 {
				spd.h = -jumpspeed*2;
			} else {
				spd.h = jumpspeed*2;
			}
		}
		if spd.v > 0 {
			spd.v -= grav*.75;
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