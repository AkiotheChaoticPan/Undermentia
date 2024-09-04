/// @description Insert description here
// You can write your code in this editor

full_room_names_file = file_text_open_read("full_room_names.json")
content = file_text_read_string(full_room_names_file)
show_debug_message(content)

global.full_room_names = json_decode(content)
global.starting_time = current_time