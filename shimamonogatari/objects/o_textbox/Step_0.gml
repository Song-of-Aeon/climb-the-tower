c_input();
count++;

if !txtprocessed {
	margin = width/20;
	//if !global.gameplay {
	//c_savevn(msgscript, style);
	//}
    msgscript();
	talksize = array_length(msg);
	talkpos = 0;
	//if msg[talkpos].bg != "UNCHANGED" bg = msg[talkpos].bg;
	textline_next();
	/*var dudes = font_get_size(draw_get_font())-1;
	var dudes2 = floor((sprite_width-margin*2)/dudes);
	msg[talkpos].text = lb_auto(msg[talkpos].text, dudes2);
	talklength = string_length(msg[talkpos].text)+1;
	drawing = ""
	drawchars = 0;
	msg[talkpos].event();
	c_charpush(new talkchar(msg[talkpos].sprite, msg[talkpos].name, msg[talkpos].spritepos));
	talkspeed = talker[0].textspeed;
	var i;
	for (i=0; i<array_length(talker[0].texteffects); i++) {
		msg[talkpos].text = talker[0].texteffects + msg[talkpos.text];
	}
	if msg[talkpos].bg != "UNCHANGED" bg = msg[talkpos].bg;
	didsounds = array_create(999);
	didfuncs = array_create(999);
	atsound = 0;
	atfunc = 0;*/
	txtprocessed = true;
}

var i;
for (i=0; i<array_length(talker); i++) {
	talker[i].x = lerp(talker[i].x, x+(talker[i].position-2)*width/5, .1);
	if talker[i].position <= SPRITEPOS.RIGHT {
		if !fading talker[i].alpha = 1 else
			talker[i].alpha = max(talker[i].alpha+.1, 0);
	} else {
		if !fading talker[i].alpha = 0 else
			talker[i].alpha = min(talker[i].alpha-.1, 0);
	}
}

if attack.hold {
	wait = 0;
}

if wait || (halting && !select) {
	wait--;
	exit;
}

if attack.hold {
    select = true;
}
if !advance {
	select = false;
}
if selecting {
	select = true;
	selecting = false;
}


if drawchars < talklength && !skipped {
    skip = select;
    drawchars += talkspeed;
	if ncm(4+round((1/talkspeed)/4)) {
		var guy = audio_play_sound(talker[0].talksound, 0, false);
		audio_sound_gain(guy, .2, 0);
		audio_sound_pitch(guy, random(1)+.5);
	}
    if skip { //yeah almost
		while drawchars <= talklength && string_copy(msg[talkpos].text, drawchars+specialchars, 2) != "|w" {
			//log(string_copy(msg[talkpos].text, drawchars, 2))
			drawchars++;
		}
    }
    message_draw = string_copy(msg[talkpos].text, 0, drawchars);
} else {
	isdone = true;
    if select textboxes_complete();
	if gotime {
		gotime = false;
        if (talkpos < talksize-1) {
			textline_next();
        } else {
			endevent();
            instance_destroy();
        }
    }
}