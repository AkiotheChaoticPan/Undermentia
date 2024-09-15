/// @description Handling option cycling
if(options[0] != undefined && text_index == text_lenghts[page] && page >= num_pages) {
	var _dir = check_right_pressed() - check_left_pressed();
	option += _dir;
	option = clamp(option, 0, 1);
}