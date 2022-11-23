step();

inv--;
hitboxradius = sprite_width/2*1.1;
collidedbullets = ds_list_create();
owlist = collision_circle_list(x, y, hitboxradius, o_bullet, false, false, collidedbullets, false);
for (i=0; i<owlist; i++) {
	ow = collidedbullets[|i];
	if ow != noone && ow.friendly && !ow.intangible {
		if inv {
			//instance_destroy(ow);
		} else {
			if ow.object_index == o_hitscan {
				//if array_contains(ow.hitlist, id) >= ow.multihit continue;
				if array_length(ow.hitlist) >= ow.multihit continue;
				if array_length(ow.hitlist) == ow.multihit-1 {
					ow.size = point_distance(x, y, ow.x, ow.y);
				}
				array_push(ow.hitlist, id);
			}
			//with global.me {
				//if c_dohook(hooks.onenemyhit, id, ow) exit;
				/*for (i=0; i<ds_list_size(hooks.onenemyhit); i++) {
					hooks.onenemyhit[|i](global.me,other.id,other.ow);
				}*/
			//}
			log(x, y, hitboxradius);
			takingdamage = ow.damage-defense;
			/*if armor {
				takingdamage /= 10;
			}*/
			//STATS.damagedealt += takingdamage;
			//if c_doenemyhook("onhit", id) exit;
			c_damagenum(id, takingdamage);
			hp -= takingdamage;
			c_screenshake(takingdamage*2, 8);
			//ds_list_add(nohit,ow);
		}
		if ow.destructible {
			instance_destroy(ow);
			//audio_play_sound(snd_enemyhurt,0,false);
		}
		
	}
}
if hp <= 0 instance_destroy();