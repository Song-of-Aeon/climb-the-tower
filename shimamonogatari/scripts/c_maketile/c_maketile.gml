function c_maketile(x, y, type) {
	var chump = instance_create(x, y, o_solid);
	object_set_mask(chump, type.cover);
	chump.sprite_index = type.sprite;
	chump.image_index = type.index;
	chump.step = munction(type.step);
	chump.draw = munction(type.draw);
	log(type.draw);
	chump.hp = type.durability;
	chump.hitboxradius = sprite_get_width(type.sprite)/2;
	chump.type = type;
	c_tilequantize(chump);
	//yeah
	return chump;
}

function c_changetile(target, type) {
	target.sprite_index = type.sprite;
	c_tilequantize(target);
	return target;
}