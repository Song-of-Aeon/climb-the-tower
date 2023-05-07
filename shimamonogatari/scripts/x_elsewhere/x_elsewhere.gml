var z=0;
repeat(9) {
	
}
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_SQUARE);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_SQUARE);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_SQUARE);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_SQUARE);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_NONE, u, spikelogic);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_NONE, u, spikelogic);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_NONE, u, spikelogic);
nu tiletype(prt_elsewhere, z++, TILESET.ELSEWHERE, TT_NONE, u, spikelogic);

function spikelogic() {
	statish("hitbox", noone);
	if !instance_exists(hitbox) {
		hitbox = c_shoot(x, y, 0, 0, bul.small, u, function() {log("ha ha")});
	}
}
//i'm going somewhere else.