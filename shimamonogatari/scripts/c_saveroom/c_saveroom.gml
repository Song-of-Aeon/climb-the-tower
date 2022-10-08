function c_saveroom(name) {
	var dude = file_text_open_write(name + ".yy");
	file_text_write_string(dude, "{\n\"isDnd\": false,\n\"volume\": 1.0,\n\"parentRoom\": null,\n");
	file_text_write_string(dude, "\"views\": [\n{\"inherit\":false,\"visible\":true,\"xview\":0,\"yview\":0,\"wview\":320,\"hview\":240,\"xport\":0,\"yport\":0,\"wport\":960,\"hport\":720,\"hborder\":32,\"vborder\":32,\"hspeed\":-1,\"vspeed\":-1,\"objectId\":null,},\n],\n")
	
	
	
	
	
	file_text_close(dude);
}