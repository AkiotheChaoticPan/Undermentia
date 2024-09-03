if (global.menu_open && visible) {

	
	var _up_k = keyboard_check_pressed(vk_up);
	var _down_k = keyboard_check_pressed(vk_down);
	var _accept = keyboard_check_pressed(vk_enter);
		
	pos += _down_k - _up_k;
	

	// option num
	con_length = array_length(cons);

	//run options
	
	if (pos >= con_length) {
		pos = 0;
	}
	if (pos < 0) {
		pos = con_length - 1;
	}

	// more sfx stuff


	if (pos != last_select) {
		audio_play_sound(use_item, 1, false);
		last_select = pos;
	}


	if (_accept) {
	
		switch(cons) {
			case "toriel":
				break;
		}
				
	}
}