global.tiletypes = {};
#macro tl global.tiletypes

nu tiletype("mistake", s_if_you, 0, TT_SQUARE);
nu tiletype("impostor", s_when_im, 0, TT_SQUARE);
nu tiletype("breakable", s_lope, 0, TT_SQUARE, u, 1);