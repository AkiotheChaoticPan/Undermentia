/// @description Initialisation for game manager when game loads

// Load save file (currently forced to load test room for debug purposes)
load("rm_testbed");

// Force player position to safe location in case save file has invalid player pos data
move_player_to_safe_pos();