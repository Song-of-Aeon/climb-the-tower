selectionzone = 0;
selectedtype = 0;
selecteddata = 0;

//datas = [[variable_struct_get_names(tl)], [array_get_indeces(mp)]];

//datas = [[o_solid, o_trigger]];

types = ["facetile", "box trigger", "edit", "play"];

typing = true;


datas[0] = [variable_struct_get_names(tl), ["funny", "unfunny"]];
datas[1] = [array_get_indeces(mp), [], []];
datas[2] = [array_get_indeces(mp),];
datas[3] = [[""]];
var i;
for (i=0; i<100; i++) {
	array_push(datas[1][1], i);
	array_push(datas[1][2], i);
}

selector = [
	array_create(99),
	array_create(99),
	array_create(99),
	array_create(99),
]

guys = [];