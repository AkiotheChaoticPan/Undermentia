global.dialogues = [
	{
		text : "* If you're reading this, something went wrong. Please reset your game.",
		font : fnt_testfont,
		next : undefined,
		item : undefined,
		play : false,
		sound : undefined,
		loop : undefined,
		option1 : undefined,
		option2 : undefined,
		auto : true
	},
	{
		text : "the name's sands. sands the skeleton.",
		font : fnt_testfont,
		next : undefined,
		item : undefined,
		play : true,
		sound : undefined,
		loop : false,
		option1 : {
			text : "break dialogue system",
			next : 0
		},
		option2 : {
			text : "continue",
			next : 2
		},
		auto : false
	},
	{
		text : "* Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla accumsan, elit sit amet varius semper, nulla mauris mollis quam, tempor suscipit diam nulla vel leo. Aliquam erat volutpat. Integer malesuada. Proin mattis lacinia justo.",
		font : fnt_testfont,
		next : undefined,
		item : undefined,
		play : true,
		sound : bgm_ruins,
		loop : false,
		option1 : undefined,
		option2 : undefined,
		auto : false
	}
];

/// @param dialogue_id
function get_dialogue(_dialogue_id){
	dia = global.dialogues[_dialogue_id];
	return dia;
}