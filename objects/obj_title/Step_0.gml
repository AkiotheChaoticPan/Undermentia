if(room == rm_title) {
	show_debug_message(image_index);
	if(image_index < frame_count && !alarm_is_set) {
		alarm_set(0, 30);
		alarm_is_set = true;
	}
	
	if(check_confirm_pressed()) {
		if(image_index < frame_count) {
			image_index = frame_count;
			alarm[0] = -1;
			alarm[1] = -1;
		} else {
			room_goto(rm_testbed);
		}
	}
} else {
	image_index = frame_count;
}