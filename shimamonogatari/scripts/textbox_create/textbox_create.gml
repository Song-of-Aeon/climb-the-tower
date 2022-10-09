function textbox_create(textscript=txt_test, style=global.textdefault, advancable=true, destroyothers=true) {
	instance_destroy(destroyothers ? o_textbox : noone);
	var chump = instance_create(style.x, style.y, o_textbox);
	chump.depth = -9999; //PROBLEMS
	chump.width = style.width;
	chump.height = style.height;
	chump.spriteposx = style.spriteposx;
	chump.spriteposy = style.spriteposy;
	chump.advance = advancable;
	chump.msgscript = textscript;
	chump.sprite_index = style.sprite;
	chump.texttype = style.type;
	chump.font = style.font;
	chump.style = style;
	return chump;
}