function mod_negative(val, modval) {
	if modval == 0 {
		log(":[");
		return 0;
	}
	if val < 1 {
		while val < 0 {
			val += modval;
		}
		return val;
	} else {
		return val % modval;
	}
}