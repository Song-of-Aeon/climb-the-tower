selectionzone = 0;
selectedtype = 0;
selecteddata = 0;
x = 160;
y = 120;

//datas = [[variable_struct_get_names(tl)], [array_get_indeces(mp)]];

//datas = [[o_solid, o_trigger]];

types = ["facetile", "box trigger", "room size", "edit", "play"];

typing = true;


datas[0] = [variable_struct_get_names(tl), ["funny", "unfunny"]];
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