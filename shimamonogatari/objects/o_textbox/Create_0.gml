/*if instance_exists(o_uicontroller) {
	o_uicontroller.UIElements = [];
	global.MenuCursor.disabled = true;
}
*/
txtprocessed = false;
keyboard_check_advanced = keyboard_check;
msgscript = txt_test;
name = "";
clr = c_white;
//draw_set_font(fm_couriernewreallybig);
msg = [txt()];
talkspeed = .5;
endevent = c_null;
talkchars = [];

width = 20;
height = 20;
spriteposx = 0;
spriteposy = 0;
talker = [new talkchar()];
talkindex = [0, 0, 0, 0, 0];
count = 0;

waiting = 0;
waited = array_create(20);
pressing = 0;
pressed = array_create(20);
wait = 0;
wigglex = 0;
wiggley = 0;
shake = 0;
selecting = false;
skipped = false;
specialchars = 0;
didsounds = array_create(999);
didfuncs = array_create(999);
atsound = 0;
atfunc = 0;
backlogging = false;
font = ft_couriernew;
backlog = [];
isdone = false;
gotime = false;
bglogic = c_null;
fglogic = c_null;
sglogic = c_null;
returnstate = 0;

nvlline = 0;

bg = [s_null];
fg = [s_null];
sg = [s_null];

drawstates = [st_textadv, st_textnvl, st_backlog];

halting = false;
fading = true;


#macro CLO ntxt(0, u, u, u, function() {halting = true; textline_next()})
#macro DECLO ntxt(0, u, u, u, function() {halting = false; textline_next()})
#macro NOD txt("")
#macro FAD ntxt(0, u, u, u, function() {fading = true})
#macro DEFAD ntxt(0, u, u, u, function() {fading = false})