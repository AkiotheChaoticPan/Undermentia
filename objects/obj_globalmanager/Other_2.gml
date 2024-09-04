/// @description Initialisation for game manager when game loads

// Load all the room names (make sure this happens before loading the file)
var full_room_names_file = file_text_open_read("full_room_names.json")
var content = file_text_read_string(full_room_names_file)
show_debug_message(content)

global.full_room_names = json_decode(content)

// Set current game time
global.starting_time = current_time

// Load save file (currently forced to load test room for debug purposes)
load("rm_testbed");

// Force player position to safe location in case save file has invalid player pos data
move_player_to_safe_pos();