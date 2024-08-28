global.dialogues = [
	{
		text : "* If you're reading this, something went wrong. Please reset your game.",
		font : fnt_testfont,
		txt_speed : 0.7,
		next : undefined,
		item : undefined,
		play : false,
		sound : undefined,
		loop : undefined,
		character : undefined,
		emotion : undefined,
		option1 : undefined,
		option2 : undefined,
		auto : true,
		voice : sfx_talk_def,
		colors : [],
		effects : []
	},
	{
		text : "the name's sands. sands the skeleton.",
		font : fnt_testfont,
		txt_speed : 0.7,
		next : undefined,
		item : undefined,
		play : true,
		sound : undefined,
		loop : false,
		character : spr_port_sands,
		emotion : 0,
		option1 : {
			text : "break dialogue system",
			next : 0
		},
		option2 : {
			text : "continue",
			next : 2
		},
		auto : false,
		voice : sfx_talk_sands,
		colors : [],
		effects : []
	},
	{
		text : "* Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla accumsan, elit sit amet varius semper, nulla mauris mollis quam, tempor suscipit diam nulla vel leo. Aliquam erat volutpat.",
		font : fnt_testfont,
		txt_speed : 1,
		next : undefined,
		item : undefined,
		play : true,
		sound : bgm_ruins,
		loop : true,
		character : spr_port_sands,
		emotion : 5,
		option1 : undefined,
		option2 : undefined,
		auto : false,
		voice : sfx_talk_sands,
		colors : [{
			start : 2,
			end_pos : 999,
			color : #ff0000
		}],
		effects : [{
			effect : "shake",
			start : 0,
			end_pos : 999,
			params : []
		},
		{
			effect : "speed",
			start : 0,
			end_pos : 10,
			params : [{
				spd : 0.7
				}]
		}]
	}
];

/// @param dialogue_id
function get_dialogue(_dialogue_id){
	dia = global.dialogues[_dialogue_id];
	return dia;
}