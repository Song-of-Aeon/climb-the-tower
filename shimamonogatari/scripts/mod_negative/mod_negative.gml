function mod_negative(val, modval) {
	if val < 1 {
		while val < 0 {
			val += modval;
		}
		return val;
	} else {
		try {
			return val % modval;
		} catch(e) {
			log(":[");
			return 0;
		}
		
	}
}