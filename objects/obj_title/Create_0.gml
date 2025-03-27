frame_count = 5;
alarm_is_set = false;
dialogue_textbox = undefined;

//display_dialogue("title_screen_cutscene", self);
if(room == rm_title) {
	audio_play_sound(bgm_beginning_menu, 1, false);
	dialogue_textbox = display_dialogue("opening_cutscene", self, true);
}