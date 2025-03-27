if (global.menu_open) {

	
	var _up_k = keyboard_check_pressed(vk_up);
	var _down_k = keyboard_check_pressed(vk_down);
	var _accept = keyboard_check_pressed(vk_enter);
		
	pos += _down_k - _up_k;
	

	// option num
	op_length = array_length(option);

	//run options

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
				if (array_length(obj_inv.inv) > 0) {  // check if inventory is not empty
					obj_inv.visible = true;
					global.inv = true;
					global._e = 1;
					global.menu_open = false;
					global.inv_open = true;
					
				} 
				else {
					// skip item option if the inventory is empty
					pos += 1;
				}
				break;
			case 1:
				obj_stat.visible = true;
				global._e = 2;
				global.menu_open = false;
				global.stat_open = true;
				break;
			case 2:
				if (array_length(obj_cell.cons) > 0) {  // check if cell is not empty
					obj_cell.visible = true;
					global.cell = true;
					global._e = 3;
					global.menu_open = false;
					global.cell_open = false;
					
					
				} 
				else {
					// skip option if the cell is empty
					pos += 1;
				}
				
				break;
		}
		
	}
}