function tiletype(name_, sprite_, collision_, shape_=TILESHAPE.SQUARE, durability_=infinity, step_=c_null, draw_=c_null, ontouch_=c_null, onstay_=c_null, onleave_=c_null) constructor {
	name = name_;
	sprite = sprite_;
	collision = collision_;
	shape = shape_;
	durability = durability_;
	step = step_;
	draw = draw_;
	ontouch = ontouch_;
	onstay = onstay_;
	onleave = onleave_;
	tl[$name] = self;
}

enum TILESHAPE {
	SQUARE
}