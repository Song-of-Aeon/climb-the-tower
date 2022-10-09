function c_charpush(char) {
	var i;
	for (i=0; i<array_length(talker); i++) {
		//log(i);
		//log(char);
		//log(talker);
		if char.name == talker[i].name {
			if char.position == SPRITEPOS.REPLACE {
				char.position = talker[i].position;
			}
			char.x = talker[i].x;
			char.y = talker[i].y;
			char.alpha = talker[i].alpha;
			array_delete(talker, i, 1);
			i--;
		}
	}
	array_insert(talker, 0, char);
}

function talkchar(spriteindex_=s_null, name_="nothingman", position_=SPRITEPOS.HIDDEN) constructor {
	sprite = global.textguy[$name_].sprite;
	talksound = global.textguy[$name_].talksound;
	textspeed = global.textguy[$name_].textspeed;
	texteffects = global.textguy[$name_].texteffects;
	font = global.textguy[$name_].font;
	namecolor = global.textguy[$name_].namecolor;
	displayname = global.textguy[$name_].displayname;
	name = name_;
	index = spriteindex_;
	position = position_;
	x = o_textbox.x+(position-2)*o_textbox.width/5;
	y = o_textbox.spriteposy;
	alpha = 0;
}

global.textguy = {};

/*global.textguy[$"drip"] = s_drip;
global.textguy[$"spamton g. spamton"] = s_drip;
global.textguy[$""] = s_null;
global.textguy[$"reimu"] = s_reimu16;
global.textguy[$"aunn"] = s_aunn16;
global.textguy[$"mike"] = s_mike16;
global.textguy[$"yukari"] = s_yukari16;
global.textguy[$"reisen"] = s_reisen16;
global.textguy[$"yumemi"] = s_yumemi16;
global.textguy[$"chiyuri"] = s_chiyuri16;*/

