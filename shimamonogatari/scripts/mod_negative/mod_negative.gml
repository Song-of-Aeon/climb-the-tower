function mod_negative(val, modval) {
	if val < 1 {
		while val < 0 {
			val += modval;
		}
		return val;
	} else {
		if(modval == 0){
			return 0
		}
		return val % modval;		
	}
}