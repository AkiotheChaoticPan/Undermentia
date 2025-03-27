if(room == rm_title) {
	show_debug_message(image_index);
	if(image_index < frame_count && !alarm_is_set) {
		dialogue_textbox.script_advance();
		alarm_set(0, 300);
		alarm_is_set = true;
	}
	
	if(check_confirm_pressed()) {
		if(image_index < frame_count) {
			show_debug_message("image index set")
			image_index = frame_count;
			alarm[0] = -1;
			alarm[1] = -1;
			audio_stop_all();
		} else {
			instance_destroy(dialogue_textbox);
			room_goto(rm_testbed);
		}
	}
} else {
	image_index = frame_count;
}