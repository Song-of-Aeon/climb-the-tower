c_input();
count = 0;

spd = {
	h: 0,
	v: 0,
	d: 0,
}
espd = {
	h: 0,
	v: 0,
	d: 0,
}
//log(global.weapons)
weapons = [
	wp.deagle,
]
eqwp = 0;

walkspeed = 1.9;
jumpspeed = 3.2;
grav = .1;
leniance = 0;
lencount = 10;
magazines = 1;
maxmagazines = 1;
aerial = false;
hp = 12;
maxhp = 12;

sprites = {
	idle: s_meidle,
	walk: s_mewalk,
	up: s_meup,
	upwalk: s_meupwalk,
	down: s_medown,
}

state = st_standard //not for long
//actionstate = st_7

xdraw = -100;
ydraw = 310;

global.me = id;
#macro df global.me
instance_create(0, 0, o_mapmanager);