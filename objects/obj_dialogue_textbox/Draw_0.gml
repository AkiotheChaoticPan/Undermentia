/// @description Drawing the textbox
x = camera_get_view_x(view_camera[0]) + pos_x;
y = camera_get_view_y(view_camera[0]) + pos_y;

if(!setup) {
	setup = true;
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var _last_i = 0;
	var _p = 0;
	var _num_chars = 0;
	for(var _c = 0; _c < text_lenght; _c++) {
		var _char = string_char_at(text, _c + 1);
		if((_char != "/" || string_char_at(text, _c) != "/") && (_char != "/" || string_char_at(text, _c + 2) != "/")) {
			chars[_c - _last_i, _p] = _char;
			_num_chars++;
		} else if(_char == "/" && string_char_at(text, _c) == "/") {
			_last_i = _c + 1;
			text_lenghts[_p] = _num_chars;
			_num_chars = 0;
			_p++;
			num_pages++;
		}
	}
	text_lenghts[_p] = _num_chars;
	
	for(var _page = 0; _page <= num_pages; _page++) {
		var _string = "";
		for(var _c = 0; _c < text_lenghts[_page]; _c++) {
			_string = string_concat(_string, chars[_c, _page]);
		}
		texts[_page] = _string;
	}
	
	for(var _page = 0; _page <= num_pages; _page++) {
		last_free_space = 0;
		break_nums[_page] = 0;
		break_offset = 0;
		for(var _c = 0; _c < text_lenghts[_page]; _c++) {
			var _txt_w = string_width(string_copy(texts[_page], 1, _c + 1)) - string_width(chars[_c, _page]);
		
			if(chars[_c, _page] == " ") {
				last_free_space = _c + 1;
			}
				
			if(_txt_w - break_offset > background_width - (margin_x * 2) - (characters[_page] != undefined ? 64 + margin_x : 0)) {
				line_breaks[break_nums[_page], _page] = last_free_space;
				break_nums[_page]++;
				break_offset = string_width(string_copy(texts[_page], 1, last_free_space)) - string_width(string_char_at(texts[_page], last_free_space));
			}
		
			color_char[_c, _page] = #ffffff;
			for(var _i = 0; _i < array_length(colors); _i++) {
				color_char[_c, _page] = colors[_i].start <= _c && colors[_i].end_pos >= _c ? colors[_i].color : color_char[_c];
			}
			effect_char[_c, _page] = [];
			effect_char_params[_c, _page] = [];
			for(var _i = 0; _i < array_length(effects); _i++) {
				if(effects[_i].start <= _c && effects[_i].end_pos >= _c) {
					array_insert(effect_char[_c, _page], array_length(effect_char[_c, _page]), effects[_i].effect);
					array_insert(effect_char_params[_c, _page], array_length(effect_char_params[_c, _page]), effects[_i].params);
				}
			}
		}
	}
	
	for(var _page = 0; _page <= num_pages; _page++) {
		for(var _c = 0; _c < text_lenghts[_page]; _c++) {
			var _txt_x = (background_width / 2) - (characters[page] != undefined ? 64 + margin_x : 0) - margin_x;
			var _txt_y = (background_height / 2) - margin_y;
			
			var _txt_w = string_width(string_copy(texts[_page], 1, _c + 1)) - string_width(chars[_c, _page]);
			var _line = 0;
		
			for(var _b = 0; _b < break_nums[_page]; _b++) {
				if(_c + 1 > line_breaks[_b, _page]) {
					var _copy = string_copy(texts[_page], line_breaks[_b, _page], _c + 1 - line_breaks[_b, _page]);
					_txt_w = string_width(_copy);
					_line = _b + 1;
				}
			}
		
			char_x[_c, _page] = _txt_x - _txt_w;
			char_y[_c, _page] = _txt_y - (line_separation * _line);
		}
	}
}

if(text_index < text_lenghts[page] && txt_timer <= 0) {
	text_index += text_speed;
	text_index = check_return_pressed() ? text_lenghts[page] : text_index;
	text_index = clamp(text_index, 0, text_lenghts[page]);
	
	if(snd_count < snd_delay) {
		snd_count++;
	} else {
		snd_count = 0;
		audio_play_sound(voices[page], 0, false);
	}
	
	var _curr_char = string_char_at(texts[page], text_index);
	
	if(_curr_char == "." || _curr_char == "," || _curr_char == "?" || _curr_char == "!") {
		txt_timer = txt_wait_time;
	}
} else if(text_index < text_lenghts[page] && txt_timer > 0) {
	text_index = check_return_pressed() ? text_lenghts[page] : text_index;
	txt_timer--;
} else if(check_confirm_pressed() || auto) {
	if(page >= num_pages) {
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
				line_breaks = [];
				break_nums = [0];
				break_offset = 0;
				last_free_space = 0;
				chars = [];
				char_x = [];
				char_y = [];
				num_pages = 0;
				page = 0;
				display_dialogue_textbox(options[option].next, self);
			}
		} else {
			text_index = 0;
			setup = false;
			line_breaks = [];
			break_nums = [0];
			break_offset = 0;
			last_free_space = 0;
			chars = [];
			char_x = [];
			char_y = [];
			num_pages = 0;
			page = 0;
			display_dialogue_textbox(next, self);
		}
	} else {
		text_index = 0;
		page++;
	}
}

draw_self();

for(var _c = 0; _c < min(text_index, text_lenghts[page]); _c++) {
	var _c_clamped = min(_c, text_index);
	var _x_offset = (array_contains(effect_char[_c, page], "shake") ? random_range(-1, 1) : 0) * 1.3;
	var _y_offset = (array_contains(effect_char[_c, page], "shake") ? random_range(-1, 1) : 0) * 1.3;
	draw_text_color(x - char_x[_c_clamped, page] + _x_offset, y - char_y[_c_clamped, page] + _y_offset, chars[_c_clamped, page], color_char[_c, page], color_char[_c, page], color_char[_c, page], color_char[_c, page], 1);
}

if(characters[page] != undefined) {
	draw_sprite(characters[page], emotions[page], x - (background_width / 2) + margin_x, y - (background_height / 2) + margin_y);
}

if(options[0] != undefined && text_index == text_lenghts[page] && page == num_pages - 1) {
	var _col0 = option == 0 ? c_yellow : c_white;
	var _col1 = option == 1 ? c_yellow : c_white;
	var _x_soul_offset = option == 0 ? 0 : (background_width / 2) + 20;
	draw_text_ext_color(x - (background_width / 2) + margin_x + (characters[page] != undefined ? 64 + margin_x : 0) + 50, y + (background_height / 2) - margin_y - 20, options[0].text, line_separation, background_width - (margin_x * 2) - (characters[page] != undefined ? 64 : 0), _col0, _col0, _col0, _col0, 1);	
	draw_text_ext_color(x + margin_x + (characters[page] != undefined ? 64 + margin_x : 0) + 70, y + (background_height / 2) - margin_y - 20, options[1].text, line_separation, background_width - (margin_x * 2) - (characters[page] != undefined ? 64 : 0), _col1, _col1, _col1, _col1, 1);
	draw_sprite_stretched(spr_soul, 1, x - (background_width / 2) + (characters[page] != undefined ? 64 : 0) + 40 + _x_soul_offset,  y + (background_height / 2) - margin_y - 20, 20, 23);
}