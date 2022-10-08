function c_tilequantize(object) {
	object.x = clamp(round(object.x/global.tilesize)*global.tilesize, 0, room_width);
	object.y = clamp(round(object.y/global.tilesize)*global.tilesize, 0, room_height);
}

function c_tilequantizeval(val) {
	return round(val/global.tilesize)*global.tilesize;
}