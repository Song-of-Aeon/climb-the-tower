function txt(text_=c_errorstring(), sprite_=global.textguy[$"nothingman"].NOTHING, spritepos_=SPRITEPOS.REPLACE, event_=c_null, sounds_=[], funcs_=[]) {
	return {
		text: text_,
		name: sprite_.char.name,
		sprite: sprite_.val,
		guy: sprite_.char,
		event: event_,
		spritepos: spritepos_,
		bg: "UNCHANGED",
		sounds: sounds_,
		funcs: funcs_,
		type:"normal",
	};
}//not technically a constructor since dont wanna write new every time

function ntxt(wait=0, sprite_=global.textguy[$"nothingman"].NOTHING, spritepos_=SPRITEPOS.HIDDEN, bg_="UNCHANGED", event_=c_null) {
	return {
		text: "|w"+ string_format(wait, 4, 0) + "|-",
		name: sprite_.char.name,
		sprite: sprite_.val,
		event: event_,
		spritepos: spritepos_,
		bg: bg_,
		type: "ntxt",
	};
}

function btxt(backgrounds=[], foregrounds=[], supergrounds=[], bglogic=c_null, fglogic=c_null, sglogic=c_null) {
	var me = ntxt();
	me.bgs = backgrounds;
	me.fgs = foregrounds;
	me.sgs = foregrounds;
	me.bglogic = bglogic;
	me.fglogic = fglogic;
	me.sglogic = sglogic;
	return me;
}

function ptxt(wait=0, sprite_=global.textguy[$"nothingman"].NOTHING, spritepos_=SPRITEPOS.HIDDEN, bg_="UNCHANGED", event_=c_null) {
	return {
		text: "",
		name: sprite_.char.name,
		sprite: sprite_.val,
		event: event_,
		spritepos: spritepos_,
		bg: bg_,
		type: "ptxt",
	};
}

enum SPRITEPOS {
	LEFT,
	MIDLEFT,
	CENTER,
	MIDRIGHT,
	RIGHT,
	HIDDEN,
	REPLACE,
}