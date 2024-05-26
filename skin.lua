dofile 'archive.lua'
dofile 'binary.lua'
dofile 'cel.lua'
dofile 'dialog.lua'
dofile 'layer.lua'
dofile 'rival.lua'
dofile 'path.lua'
dofile 'string.lua'
dofile 'table.lua'
dofile 'image.lua'

-- List of palette indexes used by each skin.
skin_colors = {
	default		=	{	0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0,		0	},
	white		=	{	0,		0,		0,		0,		1,		2,		5,		8,		9,		11,		14,		17,		20,		22,		25,		28	},
	silver		=	{	0,		1,		2,		3,		5,		7,		9,		12,		13,		15,		18,		20,		23,		25,		27,		30	},
	grey		=	{	1,		3,		5,		7,		9,		11,		13,		15,		17,		19,		21,		23,		25,		27,		29,		31	},
	nickel		=	{	3,		5,		8,		11,		15,		17,		19,		21,		23,		24,		25,		26,		27,		29,		30,		31	},
	black		=	{	4,		7,		11,		15,		20,		22,		24,		27,		28,		28,		28,		29,		29,		30,		30,		31	},
	skunk		=	{	0,		1,		2,		3,		4,		10,		16,		21,		23,		24,		25,		26,		27,		28,		29,		31	},
	fairy		=	{	0,		0,		252,	252,	200,	201,	211,	14,		16,		18,		20,		22,		24,		26,		28,		31	},
	popcorn		=	{	0,		80,		80,		81,		82,		218,	240,	11,		13,		16,		18,		21,		23,		26,		28,		31	},
	artichoke	=	{	80,		88,		89,		98,		99,		91,		12,		14,		16,		18,		20,		22,		24,		26,		28,		31	},
	pigeon		=	{	0,		128,	129,	130,	146,	170,	14,		15,		17,		19,		21,		23,		25,		27,		29,		31	},
	sepia		=	{	0,		1,		3,		5,		7,		9,		241,	242,	243,	245,	247,	249,	236,	237,	238,	239	},
	beige		=	{	0,		208,	216,	217,	240,	241,	242,	243,	245,	247,	249,	250,	251,	237,	238,	239	},
	caramel		=	{	208,	48,		216,	217,	218,	220,	221,	223,	224,	226,	228,	230,	232,	234,	236,	239	},
	peach		=	{	0,		208,	48,		216,	218,	221,	212,	213,	214,	215,	206,	207,	197,	198,	199,	254	},
	brown		=	{	216,	217,	219,	221,	224,	225,	227,	229,	230,	232,	234,	235,	237,	239,	29,		30	},
	leather		=	{	218,	221,	224,	227,	229,	231,	233,	235,	237,	239,	28,		28,		29,		29,		30,		31	},
	pink		=	{	0,		208,	208,	209,	209,	210,	211,	211,	212,	213,	214,	215,	41,		43,		45,		46	},
	rose		=	{	209,	210,	211,	211,	212,	213,	214,	215,	41,		42,		43,		44,		45,		71,		46,		47	},
	cinnamon	=	{	216,	221,	224,	226,	228,	60,		61,		43,		44,		45,		71,		46,		47,		29,		30,		31	},
	ruby		=	{	0,		208,	209,	210,	211,	213,	39,		40,		41,		43,		186,	186,	169,	169,	253,	254	},
	raspberry	=	{	0,		208,	209,	210,	32,		33,		34,		35,		37,		39,		41,		43,		44,		45,		46,		47	},
	red			=	{	209,	210,	32,		34,		36,		38,		39,		40,		41,		42,		43,		44,		45,		71,		46,		47	},
	crimson		=	{	210,	33,		35,		38,		40,		42,		43,		45,		71,		71,		46,		46,		47,		47,		30,		31	},
	maroon		=	{	32,		33,		35,		37,		39,		41,		43,		237,	26,		26,		27,		27,		28,		29,		30,		31	},
	lemonade	=	{	0,		80,		81,		82,		83,		216,	210,	211,	212,	213,	214,	215,	43,		44,		71,		47	},
	scarlet		=	{	48,		49,		50,		51,		53,		34,		36,		38,		184,	185,	168,	168,	169,	169,	254,	31	},
	ketchup		=	{	72,		73,		64,		51,		52,		54,		34,		36,		38,		40,		42,		43,		44,		71,		46,		47	},
	dawn		=	{	0,		208,	216,	209,	210,	211,	212,	57,		58,		59,		60,		61,		63,		71,		47,		31	},
	sunslam		=	{	82,		72,		73,		64,		51,		53,		55,		213,	214,	195,	195,	173,	174,	175,	253,	254	},
	creamsicle	=	{	0,		0,		208,	208,	48,		49,		50,		52,		53,		54,		56,		57,		58,		60,		61,		63	},
	orange		=	{	208,	48,		49,		50,		51,		52,		53,		54,		55,		57,		59,		60,		62,		44,		71,		47	},
	rosewood	=	{	50,		52,		55,		56,		58,		59,		60,		61,		62,		63,		44,		45,		71,		46,		47,		30	},
	tangerine	=	{	80,		81,		82,		83,		64,		51,		52,		54,		55,		57,		58,		60,		61,		63,		71,		47	},
	tan			=	{	0,		80,		81,		82,		83,		84,		85,		86,		87,		245,	246,	248,	249,	251,	237,	239	},
	cream		=	{	0,		80,		80,		81,		81,		49,		51,		222,	224,	227,	230,	233,	236,	239,	29,		31	},
	gold		=	{	0,		80,		81,		83,		64,		65,		66,		67,		68,		215,	69,		70,		44,		71,		46,		47	},
	royal		=	{	80,		81,		83,		64,		65,		223,	229,	196,	196,	197,	197,	198,	199,	29,		30,		31	},
	bronze		=	{	83,		64,		65,		66,		67,		215,	69,		70,		44,		44,		45,		71,		46,		47,		29,		31	},
	copper		=	{	0,		82,		64,		65,		67,		68,		70,		237,	239,	28,		28,		29,		29,		30,		30,		31	},
	yellow		=	{	0,		80,		81,		82,		83,		73,		84,		74,		64,		65,		66,		67,		68,		69,		70,		71	},
	mustard		=	{	80,		81,		82,		83,		64,		65,		65,		76,		76,		77,		77,		78,		79,		237,	239,	29	},
	banana		=	{	80,		81,		83,		72,		73,		74,		75,		76,		77,		78,		79,		236,	237,	238,	239,	30	},
	olive		=	{	80,		82,		73,		74,		75,		76,		77,		78,		79,		236,	237,	238,	239,	28,		29,		31	},
	crocodile	=	{	0,		80,		81,		88,		88,		188,	189,	76,		76,		77,		78,		79,		236,	237,	238,	239	},
	peridot		=	{	0,		80,		81,		88,		188,	189,	190,	191,	94,		94,		95,		95,		109,	110,	111,	31	},
	vomit		=	{	0,		208,	216,	209,	218,	51,		65,		76,		191,	191,	126,	143,	138,	175,	169,	254	},
	garden		=	{	81,		82,		83,		73,		64,		65,		66,		92,		92,		93,		93,		94,		95,		109,	110,	111	},
	lime		=	{	0,		80,		81,		88,		188,	189,	114,	114,	115,	115,	116,	116,	117,	118,	119,	111	},
	handheld	=	{	83,		72,		73,		74,		75,		76,		102,	104,	105,	106,	107,	108,	109,	110,	111,	31	},
	tea			=	{	0,		80,		80,		81,		88,		89,		90,		91,		92,		93,		94,		95,		109,	110,	111,	31	},
	pistachio	=	{	0,		80,		88,		88,		89,		90,		91,		102,	103,	104,	105,	106,	107,	108,	109,	110	},
	moss		=	{	88,		89,		90,		91,		91,		92,		93,		94,		107,	107,	108,	108,	109,	109,	110,	111	},
	camouflage	=	{	208,	84,		85,		240,	241,	243,	245,	94,		107,	108,	108,	109,	109,	110,	110,	111	},
	mint		=	{	0,		88,		88,		89,		89,		100,	101,	102,	125,	126,	143,	143,	138,	175,	169,	254	},
	green		=	{	96,		97,		98,		99,		100,	101,	102,	103,	104,	105,	106,	107,	108,	109,	110,	111	},
	pinetree	=	{	97,		99,		101,	102,	103,	104,	105,	106,	107,	108,	109,	110,	111,	30,		30,		31	},
	turtle		=	{	96,		112,	112,	113,	113,	114,	114,	115,	115,	116,	116,	117,	117,	118,	119,	111	},
	swamp		=	{	96,		112,	113,	114,	115,	116,	117,	118,	119,	119,	29,		29,		30,		30,		31,		31	},
	dream		=	{	0,		0,		208,	208,	48,		89,		98,		100,	148,	148,	172,	172,	173,	173,	174,	175	},
	plague		=	{	80,		88,		96,		112,	113,	124,	142,	149,	149,	173,	174,	175,	169,	253,	254,	31	},
	emerald		=	{	0,		120,	121,	112,	113,	114,	115,	125,	125,	126,	126,	127,	138,	175,	253,	254	},
	algae		=	{	128,	129,	130,	131,	132,	133,	134,	115,	115,	116,	116,	117,	118,	119,	110,	111	},
	aquamarine	=	{	0,		128,	120,	121,	122,	123,	124,	125,	126,	126,	127,	127,	118,	118,	119,	111	},
	turquoise	=	{	128,	120,	121,	122,	123,	141,	141,	142,	142,	143,	143,	138,	138,	139,	139,	31	},
	teal		=	{	0,		120,	120,	121,	140,	141,	142,	143,	143,	138,	138,	139,	139,	254,	254,	31	},
	robin		=	{	0,		80,		81,		82,		83,		88,		121,	140,	133,	133,	134,	135,	136,	137,	138,	139	},
	cyan		=	{	0,		0,		128,	128,	255,	131,	132,	134,	142,	142,	143,	127,	118,	119,	110,	111	},
	jawz		=	{	0,		0,		128,	128,	129,	146,	133,	134,	135,	149,	149,	173,	173,	174,	175,	31	},
	cerulean	=	{	0,		128,	129,	130,	131,	132,	133,	135,	136,	136,	137,	137,	138,	138,	139,	31	},
	navy		=	{	128,	129,	130,	132,	134,	135,	136,	137,	137,	138,	138,	139,	139,	29,		30,		31	},
	platinum	=	{	0,		0,		0,		144,	144,	145,	9,		11,		14,		142,	136,	137,	138,	138,	139,	31	},
	slate		=	{	0,		0,		144,	144,	144,	145,	145,	145,	170,	170,	171,	171,	172,	173,	174,	175	},
	steel		=	{	0,		144,	144,	145,	145,	170,	170,	171,	171,	172,	172,	173,	173,	174,	175,	31	},
	thunder		=	{	80,		81,		82,		83,		64,		65,		11,		171,	172,	173,	173,	157,	158,	159,	254,	31	},
	nova		=	{	0,		83,		49,		50,		51,		32,		192,	148,	148,	172,	173,	174,	175,	29,		30,		31	},
	rust		=	{	208,	48,		216,	217,	240,	241,	242,	171,	172,	173,	24,		25,		26,		28,		29,		31	},
	wristwatch	=	{	48,		218,	221,	224,	227,	231,	196,	173,	173,	174,	159,	159,	253,	253,	254,	31	},
	jet			=	{	145,	146,	147,	148,	149,	173,	173,	174,	175,	175,	28,		28,		29,		29,		30,		31	},
	sapphire	=	{	0,		128,	129,	131,	133,	135,	149,	150,	152,	154,	156,	158,	159,	253,	254,	31	},
	ultramarine	=	{	0,		0,		120,	120,	121,	133,	135,	149,	149,	166,	166,	167,	168,	169,	254,	31	},
	periwinkle	=	{	0,		0,		144,	144,	145,	146,	147,	149,	150,	152,	154,	155,	157,	159,	253,	254	},
	blue		=	{	144,	145,	146,	147,	148,	149,	150,	151,	152,	153,	155,	156,	158,	253,	254,	31	},
	midnight	=	{	146,	148,	149,	150,	152,	153,	155,	157,	159,	253,	253,	254,	254,	31,		31,		31	},
	blueberry	=	{	0,		144,	145,	146,	147,	171,	172,	166,	166,	167,	167,	168,	168,	175,	169,	253	},
	thistle		=	{	0,		0,		0,		252,	252,	160,	161,	162,	163,	164,	165,	166,	167,	168,	169,	254	},
	purple		=	{	0,		252,	160,	161,	162,	163,	164,	165,	166,	167,	168,	168,	169,	169,	253,	254	},
	pastel		=	{	0,		128,	128,	129,	129,	146,	170,	162,	163,	164,	165,	166,	167,	168,	169,	254	},
	moonset		=	{	0,		144,	145,	146,	170,	162,	163,	184,	184,	207,	207,	44,		45,		46,		47,		31	},
	dusk		=	{	252,	200,	201,	192,	193,	194,	172,	172,	173,	173,	174,	174,	175,	169,	253,	254	},
	violet		=	{	176,	177,	178,	179,	180,	181,	182,	183,	184,	165,	165,	166,	167,	168,	169,	254	},
	magenta		=	{	252,	200,	177,	177,	178,	179,	180,	181,	182,	183,	183,	184,	185,	186,	187,	31	},
	fuchsia		=	{	208,	209,	209,	32,		33,		182,	183,	184,	185,	185,	186,	186,	187,	253,	254,	31	},
	toxic		=	{	0,		0,		88,		88,		89,		6,		8,		10,		193,	194,	195,	184,	185,	186,	187,	31	},
	mauve		=	{	80,		81,		82,		83,		64,		50,		201,	192,	193,	194,	195,	173,	174,	175,	253,	254	},
	lavender	=	{	252,	177,	179,	192,	193,	194,	195,	196,	196,	197,	197,	198,	198,	199,	30,		31	},
	byzantium	=	{	145,	192,	193,	194,	195,	196,	197,	198,	199,	199,	29,		29,		30,		30,		31,		31	},
	pomegranate	=	{	208,	209,	210,	211,	212,	213,	214,	195,	195,	196,	196,	197,	198,	199,	29,		30	},
	lilac		=	{	0,		0,		0,		252,	252,	176,	200,	201,	179,	192,	193,	194,	195,	196,	197,	198	},
	blossom		=	{	0,		252,	252,	176,	200,	177,	201,	202,	202,	34,		36,		38,		40,		42,		45,		46	},
	taffy		=	{	0,		252,	252,	200,	200,	201,	202,	203,	204,	204,	205,	206,	207,	43,		45,		47	}
}

-- List of properties used by skins.
local skin_properties = {
	{
		type = 'entry',
		id = 'name',
		label = 'Name',
		tab = 'Properties',
		default = ''
	},
	{
		type = 'entry',
		id = 'realname',
		tab = 'Properties',
		label = 'Real Name',
		default = ''
	},
	{
		type = 'entry',
		id = 'facerank',
		label = 'Rank',
		tab = 'Face',
		default = ''
	},
	{
		type = 'entry',
		id = 'facewant',
		label = 'Want',
		tab = 'Face',
		default = ''
	},
	{
		type = 'entry',
		id = 'facemmap',
		label = 'Minimap',
		tab = 'Face',
		default = ''
	},
	{
		type = 'slider',
		id = 'kartspeed',
		label = 'Speed / Weight',
		tab = 'Properties',
		min = 1,
		max = 9,
		default = 5
	},
	{
		type = 'slider',
		id = 'kartweight',
		tab = 'Properties',
		min = 1,
		max = 9,
		default = 5
	},
	{
		type = 'color',
		id = 'startcolor',
		label = 'Start Color',
		tab = 'Properties',
		default = 96
	},
	{
		type = 'combobox',
		id = 'prefcolor',
		label = 'Preference Color',
		tab = 'Properties',
		options = table_keys(skin_colors),
		default = 'default'
	},
	{
		type = 'combobox',
		count = 3,
		id = 'rivals',
		label = 'Rivals',
		tab = 'Properties',
		options = rival_names,
		default = { 'sonic', 'sonic', 'sonic' },
		write = function(value) return table.concat(value, ',') end
	},
	{
		type = 'check',
		id = 'Ironman',
		label = 'Flags',
		tab = 'Properties',
		text = 'Ironman',
		default = false
	},
	{
		type = 'check',
		id = 'Machine',
		tab = 'Properties',
		text = 'Machine',
		default = false
	},
	{
		type = 'check',
		id = 'Badnik',
		tab = 'Properties',
		text = 'Badnik',
		default = false
	},
	{
		type = 'entry',
		id = 'DSKGLOAT',
		label = 'Gloat',
		tab = 'Sounds',
		default = 'sounds/DSKGLOAT.ogg',
		write = app.fs.fileTitle
	},
	{
		type = 'entry',
		id = 'DSKWIN',
		label = 'Win',
		tab = 'Sounds',
		default = 'sounds/DSKWIN.ogg',
		write = app.fs.fileTitle
	},
	{
		type = 'entry',
		id = 'DSKLOSE',
		label = 'Lose',
		tab = 'Sounds',
		default = 'sounds/DSKLOSE.ogg',
		write = app.fs.fileTitle
	},
	{
		type = 'entry',
		id = 'DSKSLOW',
		label = 'Slow',
		tab = 'Sounds',
		default = 'sounds/DSKSLOW.ogg',
		write = app.fs.fileTitle
	},
	{
		type = 'entry',
		id = 'DSKHURT1',
		label = 'Hurt',
		tab = 'Sounds',
		default = 'sounds/DSKHURT1.ogg',
		write = app.fs.fileTitle
	},
	{
		type = 'entry',
		id = 'DSKHURT2',
		tab = 'Sounds',
		default = 'sounds/DSKHURT2.ogg',
		write = app.fs.fileTitle
	},
	{
		type = 'entry',
		id = 'DSKATTK1',
		label = 'Attack',
		tab = 'Sounds',
		default = 'sounds/DSKATTK1.ogg',
		write = app.fs.fileTitle
	},
	{
		type = 'entry',
		id = 'DSKATTK2',
		tab = 'Sounds',
		default = 'sounds/DSKATTK2.ogg',
		write = app.fs.fileTitle
	},
	{
		type = 'entry',
		id = 'DSKBOST1',
		label = 'Boost',
		tab = 'Sounds',
		default = 'sounds/DSKBOST1.ogg',
		write = app.fs.fileTitle
	},
	{
		type = 'entry',
		id = 'DSKBOST2',
		tab = 'Sounds',
		default = 'sounds/DSKBOST2.ogg',
		write = app.fs.fileTitle
	},
	{
		type = 'entry',
		id = 'DSKHITEM',
		label = 'Hit',
		tab = 'Sounds',
		default = 'sounds/DSKHITEM.ogg',
		write = app.fs.fileTitle
	},
	{
		type = 'file',
		id = 'path',
		save = true,
		entry = true,
		default = '',
		filetypes = { 'pk3' },
		write = function() return nil end,
		changed = function(dialog)
			dialog:modify({
				id = 'save',
				enabled = dialog.data.path:match('%.pk3$') ~= nil
			})
			dialog:repaint()
		end
	}
}

-- Skin images to output, and dither for each frame.
local skin_sprites = {
	{ name = 'STIN', frames = { 0, 1 } },
	{ name = 'STIL', frames = { 0, 1 } },
	{ name = 'STIR', frames = { 0, 1 } },
	{ name = 'STGL', frames = { 0, 1 } },
	{ name = 'STGR', frames = { 0, 1 } },
	{ name = 'STLL', frames = { 0, 1 } },
	{ name = 'STLR', frames = { 0, 1 } },

	{ name = 'SLWN', frames = { 2, 0 } },
	{ name = 'SLWL', frames = { 2, 0 } },
	{ name = 'SLWR', frames = { 2, 0 } },
	{ name = 'SLGL', frames = { 2, 0 } },
	{ name = 'SLGR', frames = { 2, 0 } },
	{ name = 'SLLL', frames = { 2, 0 } },
	{ name = 'SLLR', frames = { 2, 0 } },

	{ name = 'FSTN', frames = { 0, 0 } },
	{ name = 'FSTL', frames = { 0, 0 } },
	{ name = 'FSTR', frames = { 0, 0 } },
	{ name = 'FSGL', frames = { 0, 0 } },
	{ name = 'FSGR', frames = { 0, 0 } },
	{ name = 'FSLL', frames = { 0, 0 } },
	{ name = 'FSLR', frames = { 0, 0 } },

	{ name = 'DRLN', frames = { 0, 0 } },
	{ name = 'DRLO', frames = { 2, 0 } },
	{ name = 'DRLI', frames = { 3, 0, 4, 0 } },
	{ name = 'DRRN', frames = { 0, 0 } },
	{ name = 'DRRO', frames = { 2, 0 } },
	{ name = 'DRRI', frames = { 4, 0, 3, 0 } },

	{ name = 'SPIN', frames = { 0 } },
	{ name = 'DEAD', frames = {} },
	{ name = 'SIGN', frames = {} },
	{ name = 'SIGL', frames = {} },
	{ name = 'SSIG', frames = {} },
	{ name = 'XTRA', frames = {} },
	{ name = 'TALK', frames = {} }
}

-- List of skin buttons.
local skin_buttons = {
	{
		type = 'button',
		id = 'save',
		text = 'Save'
	},
	{
		type = 'button',
		id = 'cancel',
		text = 'Cancel'
	}
}

-- Layers that have their final output cropped.
local layer_crop = {
	XTRA = true
}

-- Open dialog for saving skin.
function skin_dialog()
	-- Extract properties from current sprite and open dialog for editing.
	local dialog = Dialog({ title = 'Export Kart' })
	local save_button = skin_buttons[0]
	local data = dialog_open(dialog, skin_properties, skin_buttons, app.sprite)
	if not data.save then return end

	skin_save(data.path, skin_properties)
end

-- Write set of skin properties to a key=value string.
function skin_string(object, properties)
	local data = plugin_properties_unpack(object, properties, true)
	local out = {}

	for _, property in ipairs(properties) do
		local value = data[property.id]

		if property.write then
			value = property.write(value)
		end

		if tostring(value):find(' ') then
			error('Failed to export. Sprite property "' .. property.id .. '" cannot contain spaces.')
		end

		if value == nil or value == '' or value == false then goto continue end
		out[#out + 1] = property.id .. ' = ' .. tostring(value)
		::continue::
	end

	return table.concat(out, '\n')
end

-- Export skin archive to destination.
function skin_save(path, properties)
	-- Track array of files to output.
	local entries = {}

	if app.sprite.height > 256 then
		error('Maximum possible texture height is 256. Please shrink your sprite before exporting.')
	end

	-- Get stack of groups to output.
	local groups = {}
	for _, layer in ipairs(app.sprite.layers) do
		if layer.isGroup then
			groups[#groups + 1] = layer
		end
	end
	table.sort(groups, function (a, b) return a.stackIndex < b.stackIndex end)

	-- Start sound table.
	entries[#entries + 1] = { name = 'DS_START' }

	-- Output sounds.
	local sprite_path = app.fs.filePath(app.sprite.filename)
	for _, property in ipairs(skin_properties) do
		if property.tab ~= 'Sounds' then goto continue end

		local sound_path = app.sprite.properties(plugin_key)[property.id]
		if sound_path == '' or sound_path == nil then goto continue end
		sound_path = path_normalize(sound_path)

		entries[#entries + 1] = {
			name = app.fs.fileTitle(sound_path),
			path = app.fs.joinPath(sprite_path, sound_path)
		}

		::continue::
	end

	-- End sound table.
	entries[#entries + 1] = { name = 'DS_END' }

	-- Output skin file.
	entries[#entries + 1] = {
		name = 'S_SKIN',
		data = skin_string(app.sprite, properties)
	}

	-- Output each image file.
	local image = Image(ImageSpec{ width = app.sprite.width, height = app.sprite.height, colorMode = ColorMode.INDEXED, transparentColor = 1 })
	for _, output in ipairs(skin_sprites) do
		local layername = output.name
		local frames = output.frames

		if frames[1] ~= nil then
			-- Output single frame for each angle.
			for frame, ditherstyle in ipairs(frames) do
				local angles = { 1, 2, 3, 4, 5, 6, 7, 8 }

				-- Prescan for symmetrical output.
				local symmetrical = true
				for g, group in pairs(groups) do
					for _, angle in ipairs({ 6, 7, 8 }) do
						local cel, flipped = cel_find(group, layername, frame, angle)
						symmetrical = symmetrical and flipped
					end
				end

				if symmetrical then
					angles = { 1, 2, 3, 4, 5 }
				end

				for a, angle in ipairs(angles) do
					local dirty = false
					
					-- Output each layer in stack.
					for g, group in pairs(groups) do
						local cel, flipped = cel_find(group, layername, frame, angle)
						if cel ~= nil then
							image_blit(image, cel.image, cel.position, flipped)
							dirty = true
						end
					end

					if not dirty then
						-- Fully empty frame, skip to next one.
						goto continue
					end

					-- Apply dithering to final image.
					image_dither(image, ditherstyle)
					entries[#entries + 1] = image_entry(image, layername, frame, angle, symmetrical)
					image:clear()
					::continue::
				end
			end
		else
			-- Directionless sprite, prescan for number of frames to output.
			local symmetrical = true
			local framecount = 0
			for g, group in pairs(groups) do
				local layer = layer_find(group, layername)
				if layer == nil then goto continue end
				framecount = math.max(framecount, #layer.cels)
				::continue::
			end

			if framecount == 0 then
				-- No frames provided.
				goto continue
			end

			-- Output each layer in stack.
			for frame = 1,framecount do
				for g, group in pairs(groups) do
					-- Treat different angles as frames for more compact sprite layout.
					local cel = cel_find(group, layername, 1, frame)
					if cel ~= nil then
						image_blit(image, cel.image, cel.position, flipped)
					end
				end

				if layer_crop[layername] then
					local bounds = image:shrinkBounds()
					local cropped = Image(ImageSpec{ width=bounds.width, height=bounds.height, colorMode=ColorMode.INDEXED, transparentColor=1 })
					image_blit(cropped, image, Point(), false)
					entries[#entries + 1] = image_entry(cropped, layername, frame, 0, false)
				else
					entries[#entries + 1] = image_entry(image, layername, frame, 0, false)
				end

				image:clear()
			end

			::continue::
		end
	end

	-- Output archive of entries.
	archive_create(path, entries)
end
