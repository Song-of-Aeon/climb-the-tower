function c_maketile(x, y, type) {
	var chump = instance_create(x, y, o_solid);
	chump.sprite_index = type.sprite;
	c_tilequantize(chump);
	//yeah
}

function c_changetile(target, type) {
	target.sprite_index = type.sprite;
	c_tilequantize(chump);
	//yeah
}