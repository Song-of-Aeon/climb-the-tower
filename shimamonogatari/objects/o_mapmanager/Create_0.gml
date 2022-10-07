log(mp);
currentmap = mp[0];
c_mapchange(mp[sky_corridor], 10 tiles, 10 tiles, u, function() {
	c_maketrigger(-10, 0, 0, 240, function() {
		c_mapchange(mp[gusty_space], 20 tiles, 6 tiles);
	});
});