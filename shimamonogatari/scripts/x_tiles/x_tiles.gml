global.tiletypes = array_create_deref(TILESET.SIZE, {});
#macro tl global.tiletypes

nu tiletype("mistake", s_if_you, 0);
nu tiletype("impostor", s_when_im, 0);
nu tiletype("breakable", s_lope, 0, TILESET.MISC, TT_SQUARE, u, 1);