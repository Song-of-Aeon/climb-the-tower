global.enemies = {};
function enemy(name_, sprite_, hp_,  step_=c_null, draw_=draw_self) constructor {
	sprite = sprite_;
	hp = hp_;
	step = munction(step_);
	draw = munction(draw_);
	variable_struct_set(global.enemies, name_, self);
}

function c_spawnenemy(x, y, archetype) {
	var chump  = instance_create(x, y, o_enemy);
	chump.hp = archetype.hp;
	chump.maxhp = archetype.hp;
	chump.sprite_index = archetype.sprite;
	chump.step = archetype.step;
	chump.draw = archetype.draw;
	return chump;
}

nu enemy("impostor", s_when_im, 16);

//everybody wants to be
//my enemy