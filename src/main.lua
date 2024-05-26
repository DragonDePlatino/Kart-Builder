dofile 'about.lua'
dofile 'skin.lua'

if app.apiVersion < 22 then
	error('This script requires Aseprite v1.3-rc1 or higher.')
end

-- Initialize plugin.
function init(plugin)

	plugin:newCommand{
		id = 'KartBuilderExport',
		title = 'Export Kart',
		group = 'file_export_2',
		onclick = function()
			skin_dialog()
		end,
		onenabled = function()
			return true
		end
	}

	plugin:newCommand{
		id = 'KartBuilderAbout',
		title = 'About Kart Builder',
		group = 'help_about',
		onclick = function()
			about_dialog()
		end,
		onenabled = function()
			return true
		end
	}
end

-- Perform plugin shutdown.
function exit(plugin)

end
