function map(name_, room_, step_=c_null, draw_=c_null) constructor {
	name = name_;
	maproom = room_;
	step = step_;
	draw = draw_;
	global.maps[room_] = self;
}

global.maps = [];
nu map("Sky Corridor", sky_corridor);
nu map("Gusty Space", gusty_space);

#macro mp global.maps