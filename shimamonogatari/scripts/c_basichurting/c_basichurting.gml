function c_basichurting() {
	collidedbullets = ds_list_create();
	owlist = collision_circle_list(x, y, hitboxradius, o_bullet, false, false, collidedbullets, false);
	for (i=0; i<owlist; i++) {
		ow = collidedbullets[|i];
		if ow != noone && ow.friendly && !ow.intangible {
			if inv continue;
			if ow.object_index == o_hitscan {
				if array_length(ow.hitlist) >= ow.multihit continue;
				if array_length(ow.hitlist) == ow.multihit-1 {
					ow.size = point_distance(x, y, ow.x, ow.y);
				}
				array_push(ow.hitlist, id);
			}
			takingdamage = ow.damage-defense;
			c_damagenum(id, takingdamage);
			hp -= takingdamage;
			c_screenshake(takingdamage*2, 8);
			if ow.destructible {
				instance_destroy(ow);
			}
		}
	}
}