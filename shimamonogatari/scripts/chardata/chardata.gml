function chardata(name_="drip", displayname_="among", sprite_=s_drip, talksound_=se_null, textspeed_=.5, namecolor_=c_white, font_=ft_couriernew, texteffects_=[]) constructor {
	name = name_;
	displayname = displayname_;
	sprite = sprite_;
	talksound = talksound_;
	textspeed = textspeed_;
	namecolor = namecolor_;
	font = font_;
	texteffects = texteffects_;
	
	global.textguy[$name] = self;
}
function talksprite(name_, char_, val_) constructor {
	val = val_;
	char = global.textguy[$char_];
	char[$name_] = self;
}