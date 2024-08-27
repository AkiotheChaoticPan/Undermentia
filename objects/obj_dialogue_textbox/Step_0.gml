/// @description Handling option cycling
if(options[0] != undefined && text_index == text_lenght) {
	var _dir = check_right_pressed() - check_left_pressed();
	option += _dir;
	option = clamp(option, 0, 1);
}