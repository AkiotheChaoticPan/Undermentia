/// @param dialogue_number
/// @description Creates a new instance of a dialogue box
function display_dialogue(_num){
	dialogue = get_dialogue(_num);
	instance = instance_create_depth(0, 0, -9998, obj_dialogue_textbox);
	instance.text = dialogue.text;
	instance.font = dialogue.font;
	instance.next = dialogue.next;
	instance.item = dialogue.item;
	instance.play = dialogue.play;
	instance.sound = dialogue.sound;
	instance.loop = dialogue.loop;
	instance.text_lenght = string_length(dialogue.text);
}

/// @param dialogue_number textbox_instance
/// @description Adds a new dialogue into an existing dialogue box
function display_dialogue_textbox(_num, _textbox){
	dialogue = get_dialogue(_num);
	_textbox.text = dialogue.text;
	_textbox.font = dialogue.font;
	_textbox.next = dialogue.next;
	_textbox.item = dialogue.item;
	_textbox.play = dialogue.play;
	_textbox.sound = dialogue.sound;
	_textbox.loop = dialogue.loop;
	_textbox.text_lenght = string_length(dialogue.text);
}