if (global.menu_open && visible) {

    var _up_k = keyboard_check_pressed(vk_up);
    var _down_k = keyboard_check_pressed(vk_down);
    var _right_k = keyboard_check_pressed(vk_right);
    var _left_k = keyboard_check_pressed(vk_left);
    var _accept = keyboard_check_pressed(vk_enter);

    if (!sec_op) {
        pos += _down_k - _up_k;
        if (_right_k) {
            sec_op = true;  // lock into secondary options
            sec_pos = 0;    // reset to the first option
        }
    } else {
        sec_pos += _right_k - _left_k;
    }

    // option num
    inv_length = array_length(inv);
    op_length = array_length(option);

    // run inventory items navigation
    if (!sec_op) {
        if (pos >= inv_length) {
            pos = 0;
        }
        if (pos < 0) {
            pos = inv_length - 1;
        }
        select_item = pos;
    }

    // run options navigation
    if (sec_pos >= op_length) {
        sec_pos = 0;
    }
    if (sec_pos < 0) {
        sec_pos = op_length - 1;
    }
    select_op = sec_pos;

    // sound effects for selecting items or options
    if (sec_op) {
        if (sec_pos != last_select) {
            audio_play_sound(use_item, 1, false);
            last_select = sec_pos;
        }
    } 
	else {
        if (pos != last_select) {
            audio_play_sound(use_item, 1, false);
            last_select = pos;
        }
    }

    // Accept button functionality
    if (_accept) {
        if (!sec_op) {
			a = true;
            sec_op = true;  // lock into secondary options
        } 
		else {
            switch(sec_pos) {
				case 0:
					// create dialogue box
					inv[select_item].effect();
					keyboard_key_press(ord("Z"));
					break;
				case 1:
					// create a dialogue box
					break;
				case 2:
					array_delete(inv, select_item, 1);
					// create dialogue box
					break;
			}
        }
    }
}
