function st_ky() {
    //log(jump);
	//log(weapons[eqwp]);
	weapons[0][0].step(attack, alt);
	
	if debug.hit {
		textbox_create(txt_kotohime);
		//c_spawnenemy(10 tiles, 10 tiles, en.impostor);
	}
	accel = .1;
	
	
	if left.hold dir = 180;
	if right.hold dir = 0;
	if down.hold dir = 270;
	if up.hold dir = 90;
	
	
    hput = right.hold-left.hold;
    vput = down.hold-up.hold;
	
	c_dospritesky();
	
	if hput != 0 {
		spd.h = lerp(spd.h, hput*walkspeed, aerial ? airaccel : accel);
	} else {
		spd.h = lerp(spd.h, hput*walkspeed, aerial ? airfrict : frict);
	}
	spd.v += grav;
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
    //c_newcollision();
	var xtouching = move_and_collide(spd.h, 0, o_solid);
	var ytouching = move_and_collide(0, spd.v, o_solid);
	//log("and it");
	//log(xtouching);
	//log(ytouching);
	if array_length(ytouching) {
		leniance = lencount;
        aerial = false;
		spd.v = 0;
	} else {
		leniance--;
        aerial = true;
	}
	var dude = collision_point(x, y, o_entity, false, false);
	if dude && !aerial && down.hit {
		if dude.interactable {
			dude.interaction();
		}
	}
}