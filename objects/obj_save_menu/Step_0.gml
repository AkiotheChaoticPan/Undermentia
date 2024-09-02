/// @description

if (should_destroy) {
	global.player_interact = true
	instance_destroy(id)
}

var _right_key = check_right_pressed()
var _left_key = check_left_pressed()

var _confirm_key = check_confirm_pressed()

if ((_right_key || _left_key) && !has_saved) {
	pos = 1 - pos
	audio_play_sound(snd_bip, 0, false)
}

if (_confirm_key) {
	if (has_saved || pos == 0) {
		should_destroy = true // Destroy in next step to avoid save from retriggering
	} else if (pos == 1) {
		option[1] = "Continue"
		option[0] = ""
		has_saved = true
		save()
		audio_play_sound(snd_save, 1, false)
	}
}