function c_mapchange(map_, x, y, transitiontype=0, event=c_null) {
	room_goto(map_.maproom);
	o_mapmanager.currentmap = map_;
	df.x = x;
	df.y = y;
	event();
}

#macro tiles *global.tilesize
global.tilesize = 16;