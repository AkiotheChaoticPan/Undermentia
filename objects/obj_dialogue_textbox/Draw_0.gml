/// @description Insert description here
x = camera_get_view_x(view_camera[0]) + pos_x;
y = camera_get_view_y(view_camera[0]) + pos_y;

if(!setup) {
	setup = true;
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

if(text_index < text_lenght) {
	text_index += text_speed
	text_index = check_return_pressed() ? text_lenght : text_index;
	text_index = clamp(text_index, 0, text_lenght);
} else if(check_confirm_pressed()) {
	if(play) {
		//remaking after audio manager
		if(sound != undefined) {
			audio_play_sound(sound, 1, loop);
		} else {
			audio_stop_all();
		}
	}
	if(next == undefined) {
		instance_destroy();
	} else {
		text_index = 0;
		display_dialogue_textbox(next, self);
	}
}

draw_self();

var _drawn_text = string_copy(text, 1, text_index);
draw_text_ext(x - (background_width / 2) + margin_x + (character != undefined ? 64 : 0), y - (background_height / 2) + margin_y, _drawn_text, line_separation, background_width - (margin_x * 2) - (character != undefined ? 64 : 0));