global.dialogues = [
	{
		text : "* Hi, my name is Sands. Sands the skeleton.",
		font : fnt_testfont,
		next : 1,
		item : undefined,
		play : true,
		sound : undefined,
		loop : undefined
	},
	{
		text : "* Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla accumsan, elit sit amet varius semper, nulla mauris mollis quam, tempor suscipit diam nulla vel leo. Aliquam erat volutpat. Integer malesuada. Proin mattis lacinia justo.",
		font : fnt_testfont,
		next : undefined,
		item : undefined,
		play : true,
		sound : bgm_ruins,
		loop : false
	}
];

/// @param dialogue_id
function get_dialogue(_dialogue_id){
	dia = global.dialogues[_dialogue_id];
	return dia;
}