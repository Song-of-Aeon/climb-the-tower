instance_create(0, 0, o_mapmanager);





menuoptions = [
/*new mapsetting("daft settings", [["work it", "make it", "do it", "makes us"], ["harder", "better", "faster", "stronger"]], function() {
	
}, function() {
	draw_text(40, 40, options[0][opos[0]]);
	draw_text(40, 60, options[1][opos[1]]);
}),*/
new mapsetting("tiles", [tl, ["lol"], ["background", "behind", "main", "front", "foreground"]], function() {
	c_input();
	options[1] = variable_struct_get_names(tl[opos[0]]);
	if attack.hold {
		var dude = collision_point(c_tilequantizeval(mouse_x), c_tilequantizeval(mouse_y), o_solid, false, false);
		if dude != noone {
			instance_destroy(dude);
		}
		var thing = deep_copy(tl[opos[0]][$options[1][opos[1]]]);
		log(thing);
		var chump = c_maketile(mouse_x, mouse_y, thing);
		chump.thing = thing;
		thing.x = mouse_x;
		thing.y = mouse_y;
		thing.links = [];
		thing.depth = opos[2]
		array_push(o_mapper.guys, thing);
	
	}
	if inventory.hold {
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
	}
}, function() {
	//if !array_length(options[1]) exit;
	var z=0;
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 40, opos[0]);
	draw_set_alpha((pos==z++)+.4);
	//log(tl);
	//log(tl[opos[0]]);
	//log(tl[opos[0]][$options[1][opos[1]]]);
	var thing = tl[opos[0]][$options[1][opos[1]]];
	var friend2 = cycle(opos[1]-1, array_length(options[1]));
	var friend3 = cycle(opos[1]+1, array_length(options[1]));
	var thing2 = tl[opos[0]][$options[1][friend2]];
	var thing3 = tl[opos[0]][$options[1][friend3]];
	draw_sprite(thing.sprite, thing.index, 40, 60);
	draw_sprite_ext(thing2.sprite, thing2.index, 20, 60, 1, 1, 0, c_white, .4);
	draw_sprite_ext(thing3.sprite, thing3.index, 60, 60, 1, 1, 0, c_white, .4);
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 80, options[2][opos[2]]);
	draw_set_alpha(1);
}),
new mapsetting("entities", [["enemies", "<TRA", "other"], ["lol"], ["enabled", "disabled"]], function() {
	switch opos[0] {
		case 0:
			options = [options[0], variable_struct_get_names(en)];
			break;
		case 1:
			options = [options[0], mp, array_create_order(100, 1), array_create_order(100, 1)];
			break;
		case 2:
			options = [options[0]];
			break;
	}
}, function() {
	var z=0;
	iterate options to {
		draw_set_alpha((pos==z++)+.4);
		draw_text(40, 20+z*20, options[i][opos[i]]);
	}
}),
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
		options[1] = array_create_order(100, 1, 32);
		options[2] = array_create_order(100, 1, 18);
		o_mapper.roomsize.x = options[1][opos[1]]*global.tilesize;
		o_mapper.roomsize.y = options[2][opos[2]]*global.tilesize;
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
new mapsetting("load", [variable_struct_get_names(mp)], function() {
	c_input();
	if select c_loadmap(mp[$options[0][opos[0]]]);
}, function() {
	var z=0;
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 20+z*20, options[0][opos[0]]);
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
guys = [];
enemies = [];
triggers = [];

mousepos = new vec2();
roomsize = new vec2();

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

guys = [];

mousepos = new vec2();
roomsize = new vec2();
roomsize.x = selector[2][0] tiles;
roomsize.y = selector[2][1] tiles;
types = ["facetile", "enemies", "box trigger", "room size", "edit", "play"];
