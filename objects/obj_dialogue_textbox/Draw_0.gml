/// @description Drawing the textbox
x = camera_get_view_x(view_camera[0]) + pos_x;
y = camera_get_view_y(view_camera[0]) + pos_y;
image_xscale = background_width / 32;
image_yscale = background_height / 32;

if(!setup) {
	setup = true;
	base_text_speed = text_speed;
	base_font = font[0, 0];
	draw_set_font(base_font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var _last_i = 0;
	var _p = 0;
	var _num_chars = 0;
	for(var _c = 0; _c < text_lenght; _c++) {
		var _char = string_char_at(text, _c + 1);
		if(_char == "/" && string_char_at(text, _c) == "/" && string_char_at(text, _c - 1) == "/") {
			_last_i = _c + 1;
			array_delete(chars[_p], array_length(chars[_p]) - 2, 2);
			text_lenghts[_p] = _num_chars - 2;
			_num_chars = 0;
			_p++;
			num_pages++;
		} else {
			chars[_p, _c - _last_i] = _char;
			_num_chars++;
		}
	}
	text_lenghts[_p] = _num_chars;
	
	for(var _page = 0; _page <= num_pages; _page++) {
		var _string = "";
		for(var _c = 0; _c < text_lenghts[_page]; _c++) {
			_string = string_concat(_string, chars[_page, _c]);
		}
		texts[_page] = _string;
	}
	
	var _delete_stack = [];
	var _total_text_shortage = 0;
	var _processed_end_tags = 0;
	tag_stack = [];
	tag_index_stack = [];
	tag_lenght_stack = [];
	tag_start_stack = [];
	for(var _page = 0; _page <= num_pages; _page++) {
		for(var _c = 0; _c < text_lenghts[_page]; _c++) {
			var _char = string_char_at(texts[_page], _c + 1);
			if(_char == "<") {
				var _end_pos = _c + 1;
				for(var _i = _end_pos; _i <= text_lenghts[_page]; _i++) {
					var _ic = string_char_at(texts[_page], _i);
					_end_pos = _i;
					if(_ic == ">") {
						break;
					}
				}
				tag_lenght_stack[array_length(tag_lenght_stack)] = _end_pos - _c;
				var _string_tag = string_copy(texts[_page], _c + 2, _end_pos - _c - 2);
				var _parts = string_split(_string_tag, " ");
				if(string_char_at(_string_tag, 1) == "/") {
					_parts[0] = string_delete(_parts[0], 1, 1);
					var _start_tag = [];
					var _start = 0;
					var _len = 0;
					for(var _i = array_length(tag_stack) - 1; _i >= 0; _i--) {
						var _tag = tag_stack[_i];
						_start_tag = _tag;
						_start = tag_start_stack[_i];
						_len = tag_lenght_stack[_i];
						if(_tag[0] == _parts[0]) {
							var _pos = tag_index_stack[_i];
							array_delete(tag_stack, _i, 1);
							array_delete(tag_index_stack, _i, 1);
							array_delete(tag_start_stack, _i, 1);
							
							var _real_c = _c;
							for(var _j = 0; _j < array_length(tag_lenght_stack) - 1; _j++) {
								if(_j < _pos) {
									_start -= tag_lenght_stack[_j];
								}
								_real_c -= tag_lenght_stack[_j];
							}
							process_tag(_real_c + 1, _page, _start_tag, _start, _len);
							break;
						}
					}
				} else {
					tag_stack[array_length(tag_stack)] = _parts;
					tag_index_stack[array_length(tag_index_stack)] = array_length(tag_index_stack);
					tag_start_stack[array_length(tag_start_stack)] = _c;
				}
				_total_text_shortage += _end_pos - _c;
				_delete_stack[array_length(_delete_stack)] = [_c, _end_pos];
			}
		}
		for(var _x = array_length(tag_stack) - 1; _x >= 0; _x--) {
			var _start_tag = tag_stack[_x];
			var _index = tag_index_stack[_x];
			var _start = tag_start_stack[_x];
			var _len = tag_lenght_stack[_x];
			
			array_delete(tag_stack, _x, 1);
			array_delete(tag_index_stack, _x, 1);
			array_delete(tag_start_stack, _x, 1);
							
			for(var _j = 0; _j < array_length(tag_lenght_stack) - 1; _j++) {
				if(_j < _index) {
					_start -= tag_lenght_stack[_j];
				}
			}
			process_tag(text_lenghts[_page], _page, _start_tag, _start, _len);
		}
		for(var _t = array_length(_delete_stack) - 1; _t >= 0; _t--) {
			array_delete(chars[_page], _delete_stack[_t][0], _delete_stack[_t][1] - _delete_stack[_t][0]);
			texts[_page] = string_delete(texts[_page], _delete_stack[_t][0] + 1, _delete_stack[_t][1] - _delete_stack[_t][0]);
		}
		text_lenghts[_page] -= _total_text_shortage;
		_delete_stack = [];
		_total_text_shortage = 0;
	}
	
	base_texts = [];
	array_copy(base_texts, 0, texts, 0, array_length(texts));
	base_text_lengths = [];
	array_copy(base_text_lengths, 0, text_lenghts, 0, array_length(text_lenghts));
	base_chars = [];
	for(var _a = 0; _a < array_length(chars); _a++) {
		base_chars[_a] = [];
		array_copy(base_chars[_a], 0, chars[_a], 0, array_length(chars[_a]));
	}
	
	for(var _page = 0; _page <= num_pages; _page++) {
		for(var _c = 0; _c < text_lenghts[_page]; _c++) {
			calculate_letter_positions(_page);
			
			color_char[_c, _page] = #ffffff;
			for(var _i = 0; _i < array_length(colors); _i++) {
				if(colors[_i].page == _page) {
					color_char[_c, _page] = colors[_i].start <= _c && colors[_i].end_pos >= _c ? colors[_i].col : color_char[_c, _page];
				}
			}
			effect_char[_c, _page] = [];
			effect_char_params[_c, _page] = {};
			for(var _i = 0; _i < array_length(effects); _i++) {
				if(effects[_i].page == _page) {
					if(effects[_i].start <= _c && effects[_i].end_pos >= _c) {
						if(!array_contains(effect_char[_c, _page], effects[_i].effect)) {
							array_insert(effect_char[_c, _page], array_length(effect_char[_c, _page]), effects[_i].effect);
						}
						switch(effects[_i].effect) {
							case "shake":
								effect_char_params[_c, _page].shake = effects[_i].params;
								break;
							case "portrait":
								effect_char_params[_c, _page].portrait = effects[_i].params;
								break;
							case "text_speed":
								effect_char_params[_c, _page].text_speed = effects[_i].params;
								break;
							case "play_sound":
								effect_char_params[_c, _page].play_sound = effects[_i].params;
								break;
							case "asterisks":
								effect_char_params[_c, _page].asterisks = effects[_i].params;
								break;
							case "stop":
								effect_char_params[_c, _page].stop = effects[_i].params;
								break;
							case "event":
								if(effects[_i].start == _c) {
									effect_char_params[_c, _page].evento = effects[_i].params;
								} else {
									array_delete(effect_char[_c, _page], array_length(effect_char[_c, _page]) - 1, 1)
								}
								break;
							case "options":
								effect_char_params[_c, _page].options = effects[_i].params;
								break;
							case "auto":
								effect_char_params[_c, _page].auto = effects[_i].params;
								break;
							case "textbox":
								effect_char_params[_c, _page].textbox = effects[_i].params;
								break;
							case "wait":
								effect_char_params[_c, _page].wait = effects[_i].params;
								break;
							case "font":
								effect_char_params[_c, _page].font = effects[_i].params;
								break;
							case "voice":
								effect_char_params[_c, _page].voice = effects[_i].params;
								break;
						}
					}
				}
			}
		}
	}
	for(var _page = 0; _page <= num_pages; _page++) {
		set_letter_positions(_page);
	}
}

can_script_advance = false;
can_script_skip = false;
for(var _i = 0; _i < array_length(script_control_stack); _i++) {
	switch(script_control_stack[_i]) {
		case "advance":
			can_script_advance = true;
			break;
		case "skip":
			can_script_skip = true;
			break;
	}
}
script_control_stack = [];

if(timer > current_time) {
	//just waiting
} else if(text_index < text_lenghts[page] && txt_timer <= 0) {
	text_index = (check_return_pressed() && (!script_controlled)) || (script_controlled && can_script_skip) ? text_lenghts[page] : text_index + text_speed;
	text_index = clamp(text_index, 0, text_lenghts[page]);
	
	if(snd_count < snd_delay) {
		snd_count++;
	} else if(last_char != floor(text_index)) {
		snd_count = 0;
		audio_play_sound(voice, 0, false);
	}
	
	var _curr_char = string_char_at(texts[page], text_index + 1);
	
	if(inter_wait && (_curr_char == "." || _curr_char == "," || _curr_char == "?" || _curr_char == "!")) {
		txt_timer = txt_wait_time;
	}
} else if(text_index < text_lenghts[page] && txt_timer > 0) {
	text_index = (check_return_pressed() && (!script_controlled)) || (script_controlled && can_script_skip) ? text_lenghts[page] : text_index;
	txt_timer--;
} else if((check_confirm_pressed() && !script_controlled) || (can_script_advance && script_controlled) || auto) {
	if(page >= num_pages) {
		if(next == undefined) {
			if(array_length(options) <= 0) {
				global.in_dialogue = false;
				instance_destroy();
			} else {
				if(caller != undefined && variable_instance_exists(caller, "dialogue_message_cache")) {
					array_insert(caller.dialogue_message_cache, array_length(caller.dialogue_message_cache), option);
				}
				show_debug_message($"{options}  {option}")
				if(options[option].next == "undefined") {
					global.in_dialogue = false;
					instance_destroy();
				}
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
				effects = [];
				colors = [];
				display_dialogue_textbox(options[option].next, self, script_controlled, caller);
				options = [];
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
			effects = [];
			colors = [];
			display_dialogue_textbox(next, self, script_controlled, caller);
			options = [];
		}
	} else {
		text_index = 0;
		page++;
	}
}
last_char = floor(text_index);

draw_self();

for(var _c = 0; _c < min(text_index, text_lenghts[page]); _c++) {
	var _c_clamped = min(_c, text_index);
	var _x_offset = 0;
	var _y_offset = 0;
	
	font[_c, page] = base_font;
	size = base_size;
	if(array_length(effect_char[_c, page]) != 0) {
		var _delete = [];
		for(var _i = 0; _i < array_length(effect_char[_c, page]); _i++) {
			if(array_contains(effect_char[text_index - 1, page], "text_speed")) {
				text_speed = effect_char_params[text_index - 1, page].text_speed;
			} else {
				text_speed = base_text_speed;
			}
			if(effect_char[_c, page][_i] == "shake") {
				_x_offset = random_range(-1, 1) * effect_char_params[_c, page].shake;
				_y_offset = random_range(-1, 1) * effect_char_params[_c, page].shake;
			}
			if(effect_char[_c, page][_i] == "font") {
				font[_c, page] = effect_char_params[_c, page].font[0];
				size = effect_char_params[_c, page].font[1];
			}
			if(effect_char[_c, page][_i] == "voice") {
				voice = effect_char_params[_c, page].voice;
			} else {
				voice = sfx_talk_def;
			}
			if(effect_char[_c, page][_i] == "event") {
				if(caller != undefined && variable_instance_exists(caller, "dialogue_message_cache")) {
					array_insert(caller.dialogue_message_cache, array_length(caller.dialogue_message_cache), effect_char_params[_c, page].evento[0]);
				}
				array_insert(_delete, 0, _i);
			}
			if(array_contains(effect_char[text_index - 1, page], "auto")) {
				auto = effect_char_params[text_index - 1, page].auto;
			}
			if(effect_char[_c, page][_i] == "stop" && _c >= text_index - 2) {
				timer = current_time + effect_char_params[_c, page].stop;
				array_insert(_delete, 0, _i);
			}
			if(array_contains(effect_char[_c, page], "options") && array_length(options) == 0) {
				var _array = [];
				array_copy(_array, 0, effect_char_params[text_index - 1, page].options, 1, array_length(effect_char_params[text_index - 1, page].options) - 1);
				for(var _j = 0; _j <= array_length(_array) - 1; _j += 2) {
					array_insert(options, array_length(options), {text : _array[_j], next : _array[_j + 1]});
				}
			}
			if(array_contains(effect_char[text_index - 1, page], "wait")) {
				inter_wait = effect_char_params[text_index - 1, page].wait;
			}
			if(array_contains(effect_char[text_index - 1, page], "portrait")) {
				character = effect_char_params[text_index - 1, page].portrait[0];
				emotion = effect_char_params[text_index - 1, page].portrait[1];
			} else {
				character = undefined;
			}
			if(effect_char[_c, page][_i] == "asterisks") {
				asterisk = effect_char_params[_c, page].asterisks;
				array_insert(_delete, 0, _i);
			}
			if(array_contains(effect_char[text_index - 1, page], "textbox")) {
				image_index = effect_char_params[text_index - 1, page].textbox[0];
				if(effect_char_params[text_index - 1, page].textbox[1] != undefined) {
					pos_x = effect_char_params[text_index - 1, page].textbox[1];
					pos_y = effect_char_params[text_index - 1, page].textbox[2];
				}
				if(effect_char_params[text_index - 1, page].textbox[3] != undefined) {
					background_width = effect_char_params[text_index - 1, page].textbox[3];
					background_height = effect_char_params[text_index - 1, page].textbox[4];
				}
			}
		}
		
		for(var _del = 0; _del < array_length(_delete); _del++) {
			array_delete(effect_char[_c, page], _delete[_del], 1);
		}
		_delete = [];
		calculate_letter_positions(page);
		set_letter_positions(page);
	}
	var _color = color_char[_c, page];
	draw_set_font(font[_c, page]);
	draw_text_transformed_color(x - char_x[_c_clamped, page] + _x_offset, y - char_y[_c_clamped, page] + _y_offset, chars[page, _c_clamped], size, size, 0, _color, _color, _color, _color, 1);

	if(asterisk && array_length(forced_line_breaks) > page && array_length(forced_line_breaks[page]) > 0) {
		for(var _break = 0; _break < array_length(forced_line_breaks[page]); _break++) {
			var _x_off = -(background_width / 2) + (character != undefined ? 64 + margin_x : 0) + margin_x;
			draw_text_transformed_color(x + _x_off, y + line_separation * forced_line_breaks[page, _break] * size - (background_height / 2) + margin_y, "*", size, size, 0, _color, _color, _color, _color, 1);
		}
	}
}

if(character != undefined) {
	draw_sprite(character, emotion, x - (background_width / 2) + margin_x, y - (background_height / 2) + margin_y);
}

if(array_length(options) > 0 && text_index == text_lenghts[page] && page >= num_pages) {
	var _cols;
	for(var _i = 0; _i < array_length(options); _i++) {
		_cols[_i] = (option == _i ? c_yellow : c_white);
	}
	
	var _x_pos;
	var _y_pos;
	for(var _i = 0; _i < array_length(options); _i++) {
		switch(_i) {
			case 0:
				_x_pos = -200;
				_y_pos = 20;
				break;
			case 1:
				_x_pos = 170;
				_y_pos = 20;
				break;
			case 2:
				if(array_length(options) != 3) {
					_x_pos = -200;
					_y_pos = -10;
				} else {
					_x_pos = 0;
					_y_pos = -40;
				}
				break;
			case 3:
				_x_pos = 170;
				_y_pos = -10;
				break;
			case 4:
				_x_pos = -200;
				_y_pos = -40;
				break;
			case 5:
				_x_pos = 170;
				_y_pos = -40;
				break;
			default:
				_x_pos = -240;
				_y_pos = -48;
				break;
		}
		draw_text_ext_color(x + _x_pos, y + _y_pos, options[_i].text, line_separation, background_width - (margin_x * 2) - (character != undefined ? 64 : 0), _cols[_i], _cols[_i], _cols[_i], _cols[_i], 1);
		if(option == _i) {
			draw_sprite_stretched(spr_soul, 1, x + _x_pos - 20,  y + _y_pos, 20, 23);
		}
	}
}