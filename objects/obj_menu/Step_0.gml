if (global.menu_open) {

	var _up_k = keyboard_check_pressed(vk_up);
	var _down_k = keyboard_check_pressed(vk_down);
	var _accept = keyboard_check_pressed(vk_enter);
	

	// option num
	op_length = array_length(option);

	//run options
	pos += _down_k - _up_k;
	if (pos >= op_length) {
		pos = 0;
	}
	if (pos < 0) {
		pos = op_length - 1;
	}

	// more sfx stuff


	if (pos != last_select) {
		audio_play_sound(use_item, 1, false);
		last_select = pos;
	}


	if (_accept) {
	
		switch (pos) {
			case 0:
				obj_inv.visible = true;
				global._e = 1;
				visible = false;
				break;
			case 1:
				obj_stat.visible = true;
				global._e = 2;
				visible = false;
				break;
			case 2:
				obj_cell.visible = true;
				global._e = 3;
				visible = false;
				break;
		}
				
	}
}