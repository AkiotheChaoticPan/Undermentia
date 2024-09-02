
if place_meeting(x, y, obj_player) && check_confirm_pressed() {
	if (!instance_exists(current_menu_id)) {
		current_menu_id = instance_create_layer(obj_player.x, obj_player.y - 20, "UI", obj_save_menu)
		audio_play_sound(snd_heal, 1, false)
		global.player_interact = false
	}
}