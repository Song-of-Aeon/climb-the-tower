function bullet(name_, sprite_=s_mistake, damage_=1, destructible_=true, friendly_=false, colorable_=false, alpha_=1, draw_=c_bulletdraw, rotate_=true) constructor {
	sprite = sprite_;
	damage = damage_;
	destructible = destructible_;
	friendly = friendly_;
	colorable = colorable_;
	alpha = alpha_;
	draw = draw_;
	rotate = rotate_;
	variable_struct_set(global.bullets, name_, self);
}