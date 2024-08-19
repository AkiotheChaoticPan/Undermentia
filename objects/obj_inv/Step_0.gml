if (global.menu_open && visible) {

	
	var _up_k = keyboard_check_pressed(vk_up);
	var _down_k = keyboard_check_pressed(vk_down);
	var _accept = keyboard_check_pressed(vk_enter);
		
	pos += _down_k - _up_k;
	

	// option num
	inv_length = array_length(inv);

	//run options
	
	if (pos >= inv_length) {
		pos = 0;
	}
	if (pos < 0) {
		pos = inv_length - 1;
	}
	select_item = pos;
	// more sfx stuff


	if (pos != last_select) {
		audio_play_sound(use_item, 1, false);
		last_select = pos;
	}


	if (_accept) {
	
		inv[select_item].effect();
		keyboard_key_press(ord("Z"));
		
				
	}
}