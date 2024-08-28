/// @description Drawing the textbox
x = camera_get_view_x(view_camera[0]) + pos_x;
y = camera_get_view_y(view_camera[0]) + pos_y;

if(!setup) {
	setup = true;
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	for(var _c = 0; _c < text_lenght; _c++) {
		chars[_c] = string_char_at(text, _c + 1);
		
		var _txt_w = string_width(string_copy(text, 1, _c + 1)) - string_width(chars[_c]);
		
		if(chars[_c] == " ") {
			last_free_space = _c + 1;
		}
		
		if(_txt_w - break_offset > background_width - (margin_x * 2) - (character != undefined ? 64 + margin_x : 0)) {
			line_break[break_num] = last_free_space;
			break_num++;
			break_offset = string_width(string_copy(text, 1, last_free_space)) - string_width(string_char_at(text, last_free_space));
		}
		
		color_char[_c] = #ffffff;
		for(var _i = 0; _i < array_length(colors); _i++) {
			color_char[_c] = colors[_i].start <= _c && colors[_i].end_pos >= _c ? colors[_i].color : color_char[_c];
		}
		effect_char[_c] = [];
		effect_char_params[_c] = [];
		for(var _i = 0; _i < array_length(effects); _i++) {
			if(effects[_i].start <= _c && effects[_i].end_pos >= _c) {
				array_insert(effect_char[_c], array_length(effect_char[_c]), effects[_i].effect);
				array_insert(effect_char_params[_c], array_length(effect_char_params[_c]), effects[_i].params);
			}
		}
	}
	
	for(var _c = 0; _c < text_lenght; _c++) {
		var _txt_x = (background_width / 2) - (character != undefined ? 64 + margin_x : 0) - margin_x;
		var _txt_y = (background_height / 2) - margin_y;
		
		var _txt_w = string_width(string_copy(text, 1, _c + 1)) - string_width(chars[_c]);
		var _line = 0;
		
		show_debug_message(break_num);
		for(var _b = 0; _b < break_num; _b++) {
			if(_c + 1 > line_break[_b]) {
				var _copy = string_copy(text, line_break[_b], _c + 1 -line_break[_b]);
				_txt_w = string_width(_copy);
				_line = _b + 1;
			}
		}
		
		char_x[_c] = _txt_x - _txt_w;
		char_y[_c] = _txt_y - (line_separation * _line);
	}
}

if(text_index < text_lenght && txt_timer <= 0) {
	text_index += text_speed
	text_index = check_return_pressed() ? text_lenght : text_index;
	text_index = clamp(text_index, 0, text_lenght);
	
	if(snd_count < snd_delay) {
		snd_count++;
	} else {
		snd_count = 0;
		audio_play_sound(voice, 0, false);
	}
	
	var _curr_char = string_char_at(text, text_index);
	
	if(_curr_char == "." || _curr_char == "," || _curr_char == "?" || _curr_char == "!") {
		txt_timer = txt_wait_time;
	}
} else if(text_index < text_lenght && txt_timer > 0) {
	text_index = check_return_pressed() ? text_lenght : text_index;
	txt_timer--;
} else if(check_confirm_pressed() || auto) {
	if(play) {
		//remaking after audio manager
		if(sound != undefined) {
			audio_play_sound(sound, 1, loop);
		} else {
			audio_stop_all();
		}
	}
	if(next == undefined) {
		if(options[0] == undefined) {
			instance_destroy();
		} else {
			text_index = 0;
			setup = false;
			line_break = [];
			break_num = 0;
			break_offset = 0;
			last_free_space = 0;
			chars = [];
			char_x = [];
			char_y = [];
			display_dialogue_textbox(options[option].next, self);
		}
	} else {
		text_index = 0;
		setup = false;
		line_break = [];
		break_num = 0;
		break_offset = 0;
		last_free_space = 0;
		chars = [];
		char_x = [];
		char_y = [];
		display_dialogue_textbox(next, self);
	}
}

draw_self();

for(var _c = 0; _c < min(text_index, text_lenght); _c++) {
	var _c_clamped = min(_c, text_index);
	var _x_offset = (array_contains(effect_char[_c], "shake") ? random_range(-1, 1) : 0) * 1.3;
	var _y_offset = (array_contains(effect_char[_c], "shake") ? random_range(-1, 1) : 0) * 1.3;
	draw_text_color(x - char_x[_c_clamped] + _x_offset, y - char_y[_c_clamped] + _y_offset, chars[_c_clamped], color_char[_c], color_char[_c], color_char[_c], color_char[_c], 1);
}

if(character != undefined) {
	draw_sprite(character, emotion, x - (background_width / 2) + margin_x, y - (background_height / 2) + margin_y);
}

if(options[0] != undefined && text_index == text_lenght) {
	var _col0 = option == 0 ? c_yellow : c_white;
	var _col1 = option == 1 ? c_yellow : c_white;
	var _x_soul_offset = option == 0 ? 0 : (background_width / 2) + 20;
	draw_text_ext_color(x - (background_width / 2) + margin_x + (character != undefined ? 64 + margin_x : 0) + 50, y + (background_height / 2) - margin_y - 20, options[0].text, line_separation, background_width - (margin_x * 2) - (character != undefined ? 64 : 0), _col0, _col0, _col0, _col0, 1);	
	draw_text_ext_color(x + margin_x + (character != undefined ? 64 + margin_x : 0) + 70, y + (background_height / 2) - margin_y - 20, options[1].text, line_separation, background_width - (margin_x * 2) - (character != undefined ? 64 : 0), _col1, _col1, _col1, _col1, 1);
	draw_sprite_stretched(spr_soul, 1, x - (background_width / 2) + (character != undefined ? 64 : 0) + 40 + _x_soul_offset,  y + (background_height / 2) - margin_y - 20, 20, 23);
}