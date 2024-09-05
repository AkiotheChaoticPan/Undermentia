/// @param dialogue_number
/// @description Creates a new instance of a dialogue box
function display_dialogue(_num){
	dialogue = get_dialogue(_num);
	instance = instance_create_depth(0, 0, -9998, obj_dialogue_textbox);
	instance.text = dialogue.text;
	instance.text_speed = dialogue.txt_speed;
	instance.font = dialogue.font;
	instance.next = dialogue.next;
	instance.item = dialogue.item;
	instance.play = dialogue.play;
	instance.sound = dialogue.sound;
	instance.loop = dialogue.loop;
	instance.characters = dialogue.characters;
	instance.emotions = dialogue.emotions;
	instance.text_lenght = string_length(dialogue.text);
	instance.options[0] = dialogue.option1;
	instance.options[1] = dialogue.option2;
	instance.auto = dialogue.auto;
	instance.voices = dialogue.voices;
	instance.colors = dialogue.colors;
	instance.effects = dialogue.effects;
}

/// @param dialogue_number textbox_instance
/// @description Adds a new dialogue into an existing dialogue box
function display_dialogue_textbox(_num, _textbox){
	dialogue = get_dialogue(_num);
	_textbox.text = dialogue.text;
	_textbox.text_speed = dialogue.txt_speed;
	_textbox.font = dialogue.font;
	_textbox.next = dialogue.next;
	_textbox.item = dialogue.item;
	_textbox.play = dialogue.play;
	_textbox.sound = dialogue.sound;
	_textbox.loop = dialogue.loop;
	show_debug_message(dialogue);
	_textbox.characters = dialogue.characters;
	_textbox.emotions = dialogue.emotions;
	_textbox.text_lenght = string_length(dialogue.text);
	_textbox.options[0] = dialogue.option1;
	_textbox.options[1] = dialogue.option2;
	_textbox.auto = dialogue.auto;
	_textbox.voices = dialogue.voices;
	_textbox.colors = dialogue.colors;
	_textbox.effects = dialogue.effects;
}