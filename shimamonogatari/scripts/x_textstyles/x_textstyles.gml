global.gw = 512; //320
global.gh = 288; //240

enum TEXTTYPE {
	ADV,
	NVL,
	FREE,
	OUTLINE,
	COURT,
}

global.textdefault = {
	x: 320/2,
	y: 170,
	width: 320,
	height: 30,
	spriteposx: 210,
	spriteposy: 190,
	sprite: s_spacetext,
	type: TEXTTYPE.ADV,
	font: ft_couriernew,
}


