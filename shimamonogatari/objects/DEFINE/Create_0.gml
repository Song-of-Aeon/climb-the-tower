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
	[wp.revolver, wp.coin],
	[wp.shotgun, wp.deagle],
	[wp.nicole_dunlap, wp[$"Polar Star"]],
]
eqwp = 0;
dashing = false;
stamina = 3;
slamduration = 0;
slamming = false;
sliding = false;
punchdelay = 0;
walljumps = 3;

cameratarg = new vec2();
cameradelay = 0;

walkspeed = 1.9;
jumpspeed = 3.2;
grav = .1;
leniance = 0;
lencount = 10;
magazines = 1;
maxmagazines = 1;
aerial = false;
altpos = 0;
hp = 12;
maxhp = 12;
dir = 0;
inv = 0;

sprites = {
	idle: s_meidle,
	//idle: s_witchidle,
	walk: s_mewalk,
	up: s_meup,
	upwalk: s_meupwalk,
	down: s_medown,
}

state = st_v1 //not for long
//actionstate = st_7

xdraw = -100;
ydraw = 310;
global.count = 0;
global.me = id;
#macro df global.me
instance_create(0, 0, o_mapmanager);