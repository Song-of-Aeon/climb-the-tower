function c_loadmap(map_) {
	//log(map_);
	with all {
		if !persistent kys;
	}
	with o_mapper {
		guys = [];
		enemies = [];
		iterate map_.guys to { //bro just store their damn names
			
			if typeof(map_.guys[i].sprite) == "string" {
				map_.guys[i].sprite = asset_get_index(map_.guys[i].sprite);
			}
			if typeof(map_.guys[i].step) == "string" {
				map_.guys[i].step = script_get_index(map_.guys[i].step);
			}
			if typeof(map_.guys[i].draw) == "string" {
				map_.guys[i].draw = script_get_index(map_.guys[i].draw);
			}
			if typeof(map_.guys[i].ontouch) == "string" {
				map_.guys[i].ontouch = script_get_index(map_.guys[i].ontouch);
			}
			if typeof(map_.guys[i].onstay) == "string" {
				map_.guys[i].onstay = script_get_index(map_.guys[i].onstay);
			}
			if typeof(map_.guys[i].onleave) == "string" {
				map_.guys[i].onleave = script_get_index(map_.guys[i].onleave);
			}
			var chump = c_maketile(map_.guys[i].x, map_.guys[i].y, map_.guys[i]);
			var newman = deep_copy(map_.guys[i]);
			chump.links = newman.links;
			chump.depth = newman.depth;
			chump.thing = newman;
			array_push(guys, newman);
		}
		//log(guys);
		//log(map_.enemies);
	
		iterate map_.enemies to {
			log("enemize");
			var friend = en[$map_.enemies[i].name];
			map_.enemies[i].sprite = friend.sprite;
			map_.enemies[i].create = friend.create;
			map_.enemies[i].step = friend.step;
			map_.enemies[i].draw = friend.draw;
			/*if typeof(map_.enemies[i].sprite) == "string" {
				map_.enemies[i].sprite = asset_get_index(map_.enemies[i].sprite);
			}
			if typeof(map_.enemies[i].create) == "string" {
				log(map_.enemies[i].create, script_get_index(map_.enemies[i].create));
				map_.enemies[i].create = script_get_index(map_.enemies[i].create);
			}
			if typeof(map_.enemies[i].step) == "string" {
				log(map_.enemies[i].step, script_get_index(map_.enemies[i].step));
				map_.enemies[i].step = script_get_index(map_.enemies[i].step);
			}
			if typeof(map_.enemies[i].draw) == "string" {
				log(map_.enemies[i].draw, script_get_index(map_.enemies[i].draw));
				map_.enemies[i].draw = script_get_index(map_.enemies[i].draw);
			}*/
			var chump = c_spawnenemy(map_.enemies[i].x, map_.enemies[i].y, map_.enemies[i]);
			var newman = deep_copy(map_.enemies[i]);
			chump.links = newman.links;
			chump.thing = newman;
			array_push(enemies, newman);
			
		}
		//enemies = map_.enemies;
		//instance_create(10 tiles, 10 tiles, DEFINE);
		if !instance_exists(DEFINE) {
			instance_create(map_.spawn.x, map_.spawn.y, DEFINE);
		}
		/*iterate map_.triggers to {
			c_spawnenemy(map_.enemies[i].x, map_.enemies[i].y, map_.enemies[i]).links = map_.enemies[i].links;
		}*/
		o_mapmanager.currentmap = map_;
		global.currentbackground = global.backgrounds[$map_.bg];
	}
}