global.enemies = {};
function enemy(name_, sprite_, hp_,  step_=c_null, draw_=draw_self, create_=c_null) constructor {
	sprite = sprite_;
	hp = hp_;
	step = step_;
	draw = draw_;
	create = create_;
	variable_struct_set(global.enemies, name_, self);
}

function c_spawnenemy(x, y, archetype) {
	var chump  = instance_create(x, y, o_enemy);
	chump.hp = archetype.hp;
	chump.maxhp = archetype.hp;
	chump.sprite_index = archetype.sprite;
	chump.step = method(chump, archetype.step);
	chump.draw = method(chump, archetype.draw);
	method(chump, archetype.create)();
	return chump;
}

nu enemy("impostor", s_when_im, 100);

//everybody wants to be
//my enemy