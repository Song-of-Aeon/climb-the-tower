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
	wp.nemesis,
]
eqwp = 0;

walkspeed = 1.9;
jumpspeed = 3.2;
grav = .1;
leniance = 0;
lencount = 10;

state = st_standard //not for long
//actionstate = st_7

xdraw = -100;
ydraw = 310;

global.me = id;
#macro df global.me