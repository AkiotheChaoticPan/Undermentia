/// @param _dialogue_id
/// @description Creates a new instance of a dialogue box
function display_dialogue(_dialogue_id,  _caller_instance = undefined, _script_controlled = false) {
	if(is_string(_dialogue_id)) {
		dialogue = get_dialogue_csv(_dialogue_id);
	} else {
		dialogue = _dialogue_id;
	}
	instance = instance_create_depth(0, 0, -9998, obj_dialogue_textbox);
	instance.text = dialogue.text;
	instance.text_speed = dialogue.txt_speed;
	instance.font[0, 0] = dialogue.font;
	instance.next = dialogue.next;
	instance.text_lenght = string_length(dialogue.text);
	instance.auto = dialogue.auto;
	instance.caller = _caller_instance;
	instance.script_controlled = _script_controlled;
	return instance;
}

/// @param _dialogue_id textbox_instance
/// @description Adds a new dialogue into an existing dialogue box
function display_dialogue_textbox(_dialogue_id, _textbox, _caller_instance = undefined, _script_controlled = false) {
	if(is_string(_dialogue_id)) {
		dialogue = get_dialogue_csv(_dialogue_id);
	} else {
		dialogue = _dialogue_id;
	}
	_textbox.text = dialogue.text;
	_textbox.text_speed = dialogue.txt_speed;
	_textbox.font[0, 0] = dialogue.font;
	_textbox.next = dialogue.next;
	_textbox.text_lenght = string_length(dialogue.text);
	_textbox.auto = dialogue.auto;
	_textbox.caller = _caller_instance;
	_textbox.script_controlled = _script_controlled;
	return _textbox;
}