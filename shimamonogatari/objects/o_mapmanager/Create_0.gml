log(mp);
only_one();
//currentmap = mp[0];
///c_mapchange(mp[sky_corridor], 10 tiles, 10 tiles);
o_mapmanager.currentmap = noone;

global.timescale = 1;
global.ticks = 1;
tickCount = 0;
var file_name = file_find_first("*.aeon", 0);
while file_name != "" { //took this shit from the DOCS i didnt feel like typing
	log(file_name);
    c_loadroom(file_name);
    file_name = file_find_next();
}
file_find_close();
//c_loadmap(mp.empty);