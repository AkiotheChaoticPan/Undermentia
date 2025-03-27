/// @description Setup parameters
depth = -9998;
inter_wait = true;
last_char = 0;
option = 0;
txt_timer = 0;
txt_wait_time = 15;
background_width = 480;
background_height = 96
image_xscale = background_width / 32;
image_yscale = background_height / 32;
pos_x = 320;
pos_y = 288;
margin_x = 10;
margin_y = 8;
line_separation = 20;
text_speed = 0.7;
base_text_speed = 0.7;
font = [[fnt_undertale]];
base_font = fnt_undertale;
next = undefined;
item = undefined;
play = undefined;
sound = undefined;
loop = undefined;
options = [];
auto = false;
voice = sfx_talk_def;
colors = [];
color_char[0, 0] = #ffffff;
caller = undefined;
size = 1;
base_size = 1;

asterisk = true;
forced_breaks_at = [];
base_text_lengths = [];
base_texts = [];
base_chars = [];
forced_line_breaks = [];

timer = 0;

effects = [];
effect_char[0, 0] = [];
effect_char_params[0, 0] = [];

page = 0;
text_index = 0;
text = "If you're reading this, something went wrong. Please reset your game.";
texts = [];
text_lenght = 0;
text_lenghts[0] = 0;
chars[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;
character = undefined;
emotion = 0;
line_breaks[0, 0] = 999;
break_nums[0] = 0;
break_offset = 0;
last_free_space = 0;
setup = false;
num_pages = 0;

snd_delay = 3;
snd_count = snd_delay;

script_controlled = false;
script_control_stack = [];
can_script_advance = false;
can_script_skip = false;

function script_advance() {
	array_insert(script_control_stack, array_length(script_control_stack), "advance");
}

function script_skip() {
	array_insert(script_control_stack, array_length(script_control_stack), "skip");
}

global.in_dialogue = true;

tag_stack = [];
tag_index_stack = [];
tag_start_stack = [];
tag_lenght_stack = [];

function calculate_letter_positions(_page) {
	last_free_space = 0;
	break_nums[_page] = 0;
	break_offset = 0;
	forced_breaks_at = [];
	forced_line_breaks = [];
	text_lenghts = [];
	array_copy(text_lenghts, 0, base_text_lengths, 0, array_length(base_text_lengths));
	texts = [];
	array_copy(texts, 0, base_texts, 0, array_length(base_texts));
	chars = [];
	
	for(var _a = 0; _a < array_length(base_chars); _a++) {
		chars[_a] = [];
		array_copy(chars[_a], 0, base_chars[_a], 0, array_length(base_chars[_a]));
	}
	forced_line_breaks[_page] = [0];
	forced_breaks_at[_page] = [];
	
	var _decrease = 0;
	var _dec_i = [];
	for(var _i = 0; _i < text_lenghts[_page]; _i++) {
		if(string_char_at(texts[_page], _i) == "/" && string_char_at(texts[_page], _i + 1) == "/") {
			array_insert(forced_breaks_at[_page], array_length(forced_breaks_at[_page]), _i - 2);
			_decrease += 2;
			array_insert(_dec_i, 0, _i);
		}
	}
	
	text_lenghts[_page] -= _decrease;
	for(var _i = 0; _i < array_length(_dec_i); _i++) {
		texts[_page] = string_delete(texts[_page], _dec_i[_i], 2);
		array_delete(chars[_page], _dec_i[_i] - 1, 2);
	}
	_decrease = 0;
	_dec_i = [];
	
	for(var _c = 0; _c < text_lenghts[_page]; _c++) {
		var _txt_w = (string_width(string_copy(texts[_page], 1, _c + 1)) * size) - (string_width(chars[_page, _c]) * size);
	
		if(chars[_page, _c] == " ") {
			last_free_space = _c + 1;
		}
		for(var _j = 0; _j < array_length(forced_breaks_at[_page]); _j++) {
			if(_c == forced_breaks_at[_page, _j]) {
				last_free_space = _c + 1;
				array_insert(forced_line_breaks[_page], array_length(forced_line_breaks[_page]), break_nums[_page] + 1);
				
				line_breaks[break_nums[_page], _page] = last_free_space;
				break_nums[_page]++;
				array_insert(forced_line_breaks[_page], array_length(forced_line_breaks[_page]), break_nums[_page]);
				break_offset = string_width(string_copy(texts[_page], 1, last_free_space)) * size - string_width(string_char_at(texts[_page], last_free_space)) * size;
				break;
			}
		}
				
		if(_txt_w - break_offset > background_width - (margin_x * 2) - (character != undefined ? 64 + margin_x : 0) - (asterisk ? string_width("*") * size + margin_x : 0)) {
			line_breaks[break_nums[_page], _page] = last_free_space;
			break_nums[_page]++;
			break_offset = string_width(string_copy(texts[_page], 1, last_free_space)) * size - string_width(string_char_at(texts[_page], last_free_space)) * size;
		}
	}
}

function set_letter_positions(_page) {
	for(var _c = 0; _c < text_lenghts[_page]; _c++) {
		var _txt_x = (background_width / 2) - (character != undefined ? 64 + margin_x : 0) - (asterisk ? string_width("*") * size + margin_x : 0) - margin_x;
		var _txt_y = (background_height / 2) - margin_y;
		
		var _txt_w = (string_width(string_copy(texts[_page], 1, _c + 1)) * size) - (string_width(chars[_page, _c]) * size);
		var _line = 0;
		
		for(var _b = 0; _b < break_nums[_page]; _b++) {
			if(_c + 1 > line_breaks[_b, _page]) {
				var _copy = string_copy(texts[_page], line_breaks[_b, _page], _c + 1 - line_breaks[_b, _page]);
				_txt_w = string_width(_copy) * size;
				_line = _b + 1;
			}
		}
		
		char_x[_c, _page] = _txt_x - _txt_w;
		char_y[_c, _page] = _txt_y - (line_separation * _line * size);
	}
}

function hexcolor_convert(_hexcolor) {
    var _str = string_replace(_hexcolor,"#","");
    var _color = 0,
        _i = 1,
        _value;
    static hex2ord = function(_character) {
        var _a = ord(_character) - 48;
        if(_a < 0 || clamp(_a, 58 - 48, 64 - 48) == _a || clamp(_a, 71 - 48, 96 - 48) == _a || _a > 102 - 48) {
            return undefined
		}
        return _a < 10 ? _a : (_a < 23 ? _a - 7 : _a - 39);
    }   
    repeat string_length(_str) {
        _value = hex2ord(string_char_at(_str,_i++));
        if(_value != undefined) {
            _color = _color * 16 + _value;
		} else {
			break;
		}
    }

    if string_starts_with(_hexcolor,"#") {
        _value = (_color & 255) << 16 | (_color & $ff00);
        _color = _color >> 16 | _value;
    }
	
	return _color;
}

function process_tag(_end_index, _page, _start_tag, _start_index, _start_lenght) {
	switch(_start_tag[0]) {
		case "color":
			var _color = hexcolor_convert(_start_tag[1]);
			array_insert(colors, 0, {
				start : _start_index,
				col : _color,
				end_pos : _end_index - 2,
				page : _page
			});
			break;
		case "portrait":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "portrait",
				params : [asset_get_index(_start_tag[1]), real(_start_tag[2])],
				end_pos : _end_index - 2,
				page : _page
			});
			break;
		case "text_speed":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "text_speed",
				params : real(_start_tag[1]),
				end_pos : _end_index - 2,
				page : _page
			});
			break;
		case "shake":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "shake",
				params : real(_start_tag[1]),
				end_pos : _end_index - 2,
				page : _page
			});
			break;
		case "play_sound":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "play_sound",
				params : [asset_get_index(_start_tag[1]), bool(_start_tag[2])],
				end_pos : _end_index - 2,
				page : _page
			});
			break;
		case "event":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "event",
				params : [_start_tag[1]],
				end_pos : _start_index,
				page : _page
			});
			break;
		case "options":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "options",
				params : _start_tag,
				end_pos : _end_index - 2,
				page : _page
			});
			break;
		case "auto":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "auto",
				params : bool(_start_tag[1]),
				end_pos : _end_index - 2,
				page : _page
			});
			break;
		case "textbox":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "textbox",
				params : [real(_start_tag[1]), real(_start_tag[2]), real(_start_tag[3]), real(_start_tag[4]), real(_start_tag[5])],
				end_pos : _end_index - 2,
				page : _page
			});
			break;
		case "wait":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "wait",
				params : bool(_start_tag[1]),
				end_pos : _end_index - 2,
				page : _page
			});
			break;
		case "font":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "font",
				params : (array_length(_start_tag) > 2 ? [asset_get_index(_start_tag[1]), real(_start_tag[2])] : [asset_get_index(_start_tag[1])]),
				end_pos : _end_index - 2,
				page : _page
			});
			break;
		case "asterisks":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "asterisks",
				params : bool(_start_tag[1]),
				end_pos : _start_index,
				page : _page
			});
			break;
		case "stop":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "stop",
				params : real(_start_tag[1]),
				end_pos : _start_index,
				page : _page
			});
			break;
		case "voice":
			array_insert(effects, 0, {
				start : _start_index,
				effect : "voice",
				params : asset_get_index(_start_tag[1]),
				end_pos : _end_index - 2,
				page : _page
			});
			break;
		default:
			show_debug_message($"{_start_tag[0]} is not a valid tag. Please use one of the tags listed in the documentation.");
			break;
	}
}