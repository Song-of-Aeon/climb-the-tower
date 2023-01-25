instance_create(0, 0, o_mapmanager);





menuoptions = [
new mapsetting("daft settings", [["work it", "make it", "do it", "makes us"], ["harder", "better", "faster", "stronger"]], function() {
	
}, function() {
	log("farty");
	draw_text(40, 40, options[0][opos[0]]);
	draw_text(40, 60, options[1][opos[1]]);
}),
new mapsetting("tiles", [tl, ["lol"], ["background", "behind", "main", "front", "foreground"]], function() {
	options[1] = variable_struct_get_names(tl[opos[0]]);
}, function() {
	var z=0;
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 40, opos[0]);
	draw_set_alpha((pos==z++)+.4);
	var thing = tl[opos[0]][$options[1][opos[1]]];
	draw_sprite(thing.sprite, thing.index, 40, 60);
	draw_set_alpha((pos==z++)+.4);
	draw_text(40, 80, options[2][opos[2]]);
	draw_set_alpha(1);
}),

];




selectionzone = 0;
selectedtype = 0;
selecteddata = 0;

x = 160;
y = 120;

//datas = [[variable_struct_get_names(tl)], [array_get_indeces(mp)]];

//datas = [[o_solid, o_trigger]];

types = ["facetile", "enemies", "box trigger", "room size", "edit", "play"];

typing = true;

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

