nu chardata("nothingman", "", s_null, se_null, 1);
nu chardata("sans", "sans", s_null, se_null, 1, u, ft_comicsans);
nu talksprite("NOTHING", "nothingman", 0);
nu talksprite("NOTHING", "sans", 0);




//chardata template
nu chardata("terry davis", "T. Davey", s_null, se_null, .5);
var z=0;
nu talksprite("EXPRESSION1", "terry davis", z++);
nu talksprite("EXPRESSION2", "terry davis", z++);
nu talksprite("ETC", "terry davis", z++);
#macro REISEN global.textguy[$"terry davis"]
#macro SANS global.textguy[$"sans"]




