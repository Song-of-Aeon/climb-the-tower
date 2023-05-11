function c_maketile(x, y, type, depth_) {
	//log(type);
	if type.sprite == prt_sdm {
		switch type.index+1 {
			case 17:
			case 18:
			case 29:
			case 30:
			case 35:
			case 36:
			case 39:
			case 41:
			case 42:
			case 45:
			case 47:
			case 48:
			case 51:
			case 53:
			case 54:
			case 57:
			case 59:
			case 60:
			case 61:
			case 62:
			case 63:
			case 64:
			case 65:
			case 66:
			case 67:
			case 68:
			case 69:
			case 70:
			case 71:
			case 72:
			case 73:
			case 74:
			case 75:
			case 76:
			case 77:
			case 78:
			case 79:
			case 80:
			case 81:
			case 82:
			case 83:
			case 84:
			case 85:
			case 86:
			case 87:
			case 88:
			case 89:
			case 90:
			case 99:
			case 100:
			case 101:
			case 105:
			case 106:
			case 107:
			case 111:
			case 112:
			case 113:
			case 117:
			case 118:
			case 119:
				var chump = instance_create(x, y, o_notsolid);
				break;
				
			default:
				var chump = instance_create(x, y, o_solid);
				break;
		}
	} else {
		if type.cover == TT_NONE || depth_ != 0 {
			var chump = instance_create(x, y, o_notsolid);
		} else {
			var chump = instance_create(x, y, o_solid);
		}
	}
	//object_set_mask(chump, type.cover);
	mask_index = type.cover;
	chump.sprite_index = type.sprite;
	chump.image_index = type.index;
	chump.step = munction(type.step);
	chump.draw = munction(type.draw);
	chump.ontouch = munction(type.ontouch);
	chump.onstay = munction(type.onstay);
	chump.onleave = munction(type.onleave);
	chump.depth = depth_;
	//log(type.draw);
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