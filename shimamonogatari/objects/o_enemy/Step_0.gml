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
			//with global.me {
				//if c_dohook(hooks.onenemyhit, id, ow) exit;
				/*for (i=0; i<ds_list_size(hooks.onenemyhit); i++) {
					hooks.onenemyhit[|i](global.me,other.id,other.ow);
				}*/
			//}
			takingdamage = ow.damage-defense;
			/*if armor {
				takingdamage /= 10;
			}*/
			//STATS.damagedealt += takingdamage;
			//if c_doenemyhook("onhit", id) exit;
			hp -= takingdamage;
			//ds_list_add(nohit,ow);
		}
		if ow.destructible {
			instance_destroy(ow);
			//audio_play_sound(snd_enemyhurt,0,false);
		}
		
	}
}
if hp <= 0 instance_destroy();