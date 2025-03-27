# DIALOGUE SYSTEM DOCUMENTATION

This is a detailed explanation of the dialogue system used by this project. The system works on basis of a CSV file containing all the dialogue information needed. To access this information, use function ```get_dialogue_csv(string: dialogue_id)``` which returns a struct consisting of: ```string: text, real: txt_speed, string: next, bool: auto, instanceId: font```. To create a dialogue textbox with a selected text, use the function ```display_dialogue(string: dialogue_id, opt. bool: is_script_controlled, opt. InstanceId: creator_id)```. To reuse a dialogue textbox with a selected text, use the function ```display_dialogue_textbox(string: dialogue_id, instanceId: textbox_id, opt. bool: is_script_controlled, opt. InstanceId: creator_id)```. Both display_dialogue function versions return the instance_id of the textbox. The creator id is used to send events(e.g. Dialogue options selection, custom event, etc.) back to the creating instance. You can also use a raw dialogue struct instead of the dialogue_id. The is_script_controlled parameter is used to specify, whether the script is responsible for advancing the dialogue, or the player. Use function ```[textbox_instance].script_skip();``` to skip the dialogue, or the function ```[textbox_instance].script_advance();``` to advance the dialogue.
To create a new dialogue page(same textbox, but a new dialogue), use `///`, and to force a new line, use `//`.

## Tags

Most of the formatting is done by tags. Tags work like in the html language, being declared by a pair of triangular brackets, tag name, tag parameters, with the ending tag having a slash before the name (for example: `<color #FF0099>This is a colored text</color>`). The following is a list of existing tags and their descriptions:

### Double

#### color

This tag alters the color of the text within the tag.

Parameters - the color of the text in hex format(```#RRGGBB```)

#### portrait

This tag sets the character portrait of the selected section.

Parameters - sprite of the portrait(object id), frame of the sprite(real)

#### text_speed

This tag sets the speed of the text typing effect in the enclosed region.

Parameters - speed of the text(real)

#### shake

This tag makes the selected region of text shake.

Parameters - amplitude of the shaking(real)

#### wait

This tag makes the selected region of text (not) wait on punctuation.

Parameters - stop on punctuation(bool)

#### font

This tag applies a selected font and size multiplier to the region.

Parameters - font(object id), size(real)

#### voice

This tag makes the text play the specified voice when typing.

Parameters - textbox id(real), position x(real), position y(real), width(real), height(real)

### Single

#### play_sound - to be reworked

This tag plays a sound.

Parameters - sound to play(object id), looping(boolean)

#### event

This tag triggers an event and send a signal to the instance that originally requested to create the dialogue.

Parameters - sound to play(object id), looping(boolean)

#### auto

This tag toggles automatic continuation of the dialogue.

Parameters - continue dialogue automatically(bool)

#### options

This tag triggers a prompt to choose an option from 2 to 6 possibilities. It also sends the result to the creating instance.

Parameters - option display name(string), dialogue address after selection(string) (repeating for every added option)

#### textbox - currently a little buggy

This tag makes the text use the selected version of the textbox, alongside with it's size and position.

Parameters - textbox id(real), position x(real), position y(real), width(real), height(real)

#### asterisk

This tag toggles the pre-text asterisks.

Parameters - enabled(bool)

#### stop

This tag stops the text typing for the specified amount of miliseconds.

Parameters - miliseconds to wait(real)
