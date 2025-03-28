/// @description Handling option cycling
if(array_length(options) > 0 && text_index == text_lenghts[page] && page >= num_pages) {
	var _x_dir = check_right_pressed() - check_left_pressed();
	var _y_dir = check_up_pressed() - check_down_pressed();
	option += _x_dir;
	option += _y_dir * 2;
	option = clamp(option, 0, array_length(options) - 1);
}