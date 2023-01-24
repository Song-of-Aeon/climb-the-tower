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
	[wp.bounceback, wp.nicole_dunlap],
];
arm = [
	wp.feedbacker,
	wp[$"Polar Star"],
]
eqwp = 0;
eqarm = 0;
dashing = false;
stamina = 3;
slamduration = 0;
slamming = false;
sliding = false;
punchdelay = 0;
walljumps = 3;

cameratarg = new vec2();
cameradelay = 0;
wingpos = [
	new vec2(),
	new vec2(),
	new vec2(),
	new vec2(),
	new vec2(),
	new vec2(),
	new vec2(),
	new vec2(),
]

accel = .1;
frict = .1;
airaccel = .1;
airfrict = .1;
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

/*sprites = {
	idle: s_meidle,
	walk: s_mewalk,
	up: s_meup,
	upwalk: s_meupwalk,
	down: s_medown,
}*/

sprites = {
	idle: s_v1,
	walk: s_v1,
	up: s_v1,
	upwalk: s_v1,
	down: s_v1,
}

/*sprites = {
	idle: s_lily,
	walk: s_lilyrun,
	run: s_lilyfastrun,
	up: s_lily,
	upwalk: s_lily,
	down: s_lily,
	jump: s_lilyjump,
}
sprites = {
	idle: s_lily,
	walk: s_lily,
	run: s_lily,
	up: s_lily,
	upwalk: s_lily,
	down: s_lily,
	jump: s_lily,
}*/
faceangle = 0;

state = st_v1 //not for long
drawstate = st_v1draw;
//actionstate = st_7

xdraw = -100;
ydraw = 310;
global.count = 0;
global.me = id;
#macro df global.me
instance_create(0, 0, o_mapmanager);

//lilystats
/*
walkspeed = 1.7;
jumpspeed = 4.6;
grav = .12
leniance = 6;
accel = .1;
airaccel = .1;
frict = .16;
airfrict = .08;
dashtime = 0;
*/