instance_create(0, 0, o_mapmanager);





menuoptions = [
/*new mapsetting("daft settings", [["work it", "make it", "do it", "makes us"], ["harder", "better", "faster", "stronger"]], function() {
	
}, function() {
	draw_text(40, 40, options[0][opos[0]]);
	draw_text(40, 60, options[1][opos[1]]);
}),*/
new mapsetting("tiles", [tl, ["lol"], ["background", "behind", "main", "front", "foreground"]], function() {
	palette = new vec2(WIDTH*1.8, HEIGHT*.8);
	c_input();
	options[1] = tl[opos[0]];
	if !array_length(options[2]) exit;
	if mouse_within(palette.x, palette.y, WIDTH*2, HEIGHT*2) exit;
	if attack.hold {
		var thelist = ds_list_create();
		var dude = collision_point_list(c_tilequantizeval(mouse_x), c_tilequantizeval(mouse_y), o_solid, false, false, thelist, false);
		var i;
		for (i=0; i<dude; i++) {
			log(thelist[|i].depth, opos[2]);
			if thelist[|i].depth == opos[2] {
				log("deleting");
				array_remove(o_mapper.guys, thelist[|i].thing);
				instance_destroy(thelist[|i]);
				log("deleted");
			}
		}
		ds_list_destroy(thelist);
		var thing = deep_copy(options[1][opos[1]]);
		log(thing);
		var chump = c_maketile(mouse_x, mouse_y, thing);
		chump.thing = thing;
		chump.depth = opos[2];
		thing.x = mouse_x;
		thing.y = mouse_y;
		thing.links = [];
		thing.depth = opos[2];
		array_push(o_mapper.guys, thing);
	
	}
	if inventory.hold {
		var thelist = ds_list_create();
		var dude = collision_point_list(mouse_x, mouse_y, o_solid, false, false, thelist, false);
		var i;
		for (i=0; i<dude; i++) {
			log(thelist[|i].depth, opos[2]);
			if thelist[|i].depth == opos[2] {
				log("deleting");
				array_remove(o_mapper.guys, thelist[|i].thing);
				instance_destroy(thelist[|i]);
				log("deleted");
			}
		}
		ds_list_destroy(thelist);
	}
}, function() {
	var z=0;
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 40, opos[0]);
	draw_set_alpha(1);
	if !array_length(options[1]) exit;
	draw_set_alpha((pos==z++)+.4);
	var thing = options[1][opos[1]];
	var friend2 = cycle(opos[1]-1, array_length(options[1]));
	var friend3 = cycle(opos[1]+1, array_length(options[1]));
	var thing2 = options[1][friend2];
	var thing3 = options[1][friend3];
	draw_sprite(thing.sprite, thing.index, 40, 60);
	draw_sprite_ext(thing2.sprite, thing2.index, 20, 60, 1, 1, 0, c_white, .4);
	draw_sprite_ext(thing3.sprite, thing3.index, 60, 60, 1, 1, 0, c_white, .4);
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 80, options[2][opos[2]]);
	draw_set_alpha(1);
	if !mouse_within(palette.x, palette.y, WIDTH*2, HEIGHT*2) draw_set_alpha(.4);
	iterate options[1] to {
		draw_sprite(global.tssprites[opos[0]], i, palette.x+i%6*16+8, palette.y+floor(i/6)*16+8);
		if mouse_within(palette.x+i%6*16, palette.y+floor(i/6)*16, palette.x+i%6*16+16, palette.y+floor(i/6)*16+16) && attack.hit {
			opos[1] = i;
		}
	}
	draw_circle(window_mouse_get_x(), window_mouse_get_y(), 3, false);
}),
new mapsetting("entities", [["enemies"], ["lol"], ["enabled", "disabled"]], function() {
	c_input();
	options = [options[0], variable_struct_get_names(en)];
	if attack.hit {
		var thelist = ds_list_create();
		var dude = collision_point_list(mouse_x, mouse_y, o_enemy, false, false, thelist, false);
		var i;
		for (i=0; i<dude; i++) {
			log("deleting");
			array_remove(o_mapper.enemies, thelist[|i].thing);
			instance_destroy(thelist[|i]);
			log("deleted");
		}
		ds_list_destroy(thelist);
		var thing = deep_copy(en[$options[1][opos[1]]]);
		log(thing);
		var chump = c_spawnenemy(mouse_x, mouse_y, thing);
		chump.step = c_null;
		chump.thing = thing;
		chump.image_speed = 0;
		thing.x = mouse_x;
		thing.y = mouse_y;
		thing.links = [];
		log(thing);
		array_push(o_mapper.enemies, thing);
	}
	if inventory.hold {
		var thelist = ds_list_create();
		var dude = collision_point_list(mouse_x, mouse_y, o_enemy, false, false, thelist, false);
		var i;
		for (i=0; i<dude; i++) {
			log("deleting");
			array_remove(o_mapper.enemies, thelist[|i].thing);
			instance_destroy(thelist[|i]);
			log("deleted");
		}
		ds_list_destroy(thelist);
	}
}, function() {
	var z=0;
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 20+z*20, options[0][opos[0]]);
	var thing = en[$options[1][opos[1]]];
	draw_set_alpha((pos==z++)+.4);
	draw_sprite(thing.sprite, 0, 40, 60);
}),
new mapsetting("triggers", [["tra", "touch event", "link"], variable_struct_get_names(mp), array_create_order(100), array_create_order(100)], function() {
	c_input();
	if opos[0] < 2 {
		if attack.hit {
			mydude = c_maketrigger(mouse_x, mouse_y, mouse_x, mouse_y);
			mydude.target = mp[$options[1][opos[1]]];
			mydude.targetx = options[2][opos[2]] tiles;
			mydude.targety = options[3][opos[3]] tiles;
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
	}
}, function() {}),
new mapsetting("map settings", [["name", "size"], ["lol"], ["lol"]], function() {
	c
	c_input();
	if !opos[0] {
		if select {
			log("ha");
			o_mapper.roomname = get_string("you fear this place.", "");
		}
		pos = 0;
	} else {
		options[1] = array_create_order(200, 1, 32);
		options[2] = array_create_order(200, 1, 18);
		o_mapper.roomsize.x = options[1][opos[1]] tiles;
		o_mapper.roomsize.y = options[2][opos[2]] tiles;
	}
}, function() {
	var z=0;
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 20+z*20, options[0][opos[0]]);
	if !opos[0] {
		draw_set_alpha((pos==z++)+.4);
		draw_text(40, 20+z*20, o_mapper.roomname + (count%60 < 30 ? "|" : ""));
	} else {
		draw_set_alpha((pos==z++)+.4);
		draw_text(40, 20+z*20, options[1][opos[1]]);
		draw_set_alpha((pos==z++)+.4);
		draw_text(40, 20+z*20, options[2][opos[2]]);
	}
	draw_set_alpha(1);
}),
new mapsetting("save", [["really save?"]], function() {
	c_input();
	if select {
		log("balling");
		with o_mapper {c_saveroom(roomname)};
	}
}, function() {
	var z=0;
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 20+z*20, options[0][opos[0]]);
	draw_set_alpha(1);
}),
new mapsetting("load", [["edit mode", "play game"], variable_struct_get_names(mp)], function() {
	c_input();
	if select {
		var friend = mp[$options[1][opos[1]]];
		c_loadmap(friend);
		if opos[0] {
			instance_destroy(o_mapper);
			log("enemied");
			with o_enemy {
				step = archetype.step;
			}
		} else {
			log("unenemied");
			with o_enemy {
				step = c_null;
			}
			with o_mapper {
				roomname = friend.roomname;
				roomsize = friend.roomsize;
				//guys = friend.guys;
				//enemies = friend.enemies;
				triggers = friend.triggers;
			}
		}
	}
}, function() {
	var z=0;
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 20+z*20, options[0][opos[0]]);
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 20+z*20, options[1][opos[1]]);
	draw_set_alpha(1);
}),
];

//menuoptions[3].opos[1] = 
count = 0;

roomsize = new vec2(512, 288);
roomname = "";


selectionzone = 0;
selectedtype = 0;
selecteddata = 0;

x = 160;
y = 120;

//datas = [[variable_struct_get_names(tl)], [array_get_indeces(mp)]];

//datas = [[o_solid, o_trigger]];

typing = true;
log("NO GUYS");
guys = [];
enemies = [];
triggers = [];

mousepos = new vec2();

var friend = mp[$"sdm"];
c_loadmap(friend);
instance_destroy(o_mapper);
log("enemied");
with o_enemy {
	step = archetype.step;
}
instance_create(10 tiles, 10 tiles, DEFINE);

exit;
datas[0] = [variable_struct_get_names(tl), [-2, -1, 0, 1, 2]];
datas[1] = [variable_struct_get_names(en)];
datas[1] = [array_get_indeces(mp), [], []];
datas[2] = [[], []];
datas[3] = [array_get_indeces(mp),];
datas[4] = [[""]];
var i;
for (i=0; i<100; i++) {
	array_push(datas[1][1], i);
	array_push(datas[1][2], i);
	array_push(datas[2][0], i);
	array_push(datas[2][1], i);
}

selector = [
	array_create(99),
	array_create(99),
	array_create(99),
	array_create(99),
	array_create(99),
]

selector[2][0] = 320/(1 tiles);
selector[2][1] = 240/(1 tiles);

//guys = [];

mousepos = new vec2();
roomsize = new vec2();
roomsize.x = selector[2][0] tiles;
roomsize.y = selector[2][1] tiles;
types = ["facetile", "enemies", "box trigger", "room size", "edit", "play"];
