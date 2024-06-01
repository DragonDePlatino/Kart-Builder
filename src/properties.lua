dofile 'color.lua'
dofile 'dialog.lua'
dofile 'table.lua'

-- List of properties used by skins.
properties_skin = {
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
		default = 96,
		changed = function()
			local result = palette_preview(true)
			if errored(result) then dialog_error(result) end
		end
	},
	{
		type = 'combobox',
		id = 'prefcolor',
		label = 'Preference Color',
		tab = 'Properties',
		options = table_keys(colors_skin),
		default = 'default',
		changed = function()
			local result = palette_preview()
			if errored(result) then dialog_error(result) end
		end
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
				id = 'export',
				enabled = dialog.data.path:match('%.pk3$') ~= nil
			})
			dialog:repaint()
		end
	}
}
