dofile 'about.lua'
dofile 'skin.lua'

if app.apiVersion < 22 then
	local error = error_new{ 'This script requires Aseprite v1.3-rc1 or higher.', 'Older Aseprite versions and LibreSprite are not supported.' }
	dialog_error(error)
	return
end

-- Initialize plugin.
function init(plugin)
	plugin:newCommand{
		id = 'KartBuilderExport',
		title = 'Export Kart',
		group = 'file_export_2',
		onclick = function()
			local result = archive_init()
			if errored(result) then
				local error = error_new('Error initializing archiver.', result)
				return dialog_error(error)
			end

			local result = skin_dialog()
			if errored(result) then
				local error = error_new('Error exporting skin.', result)
				return dialog_error(error)
			end
		end
	}

	plugin:newCommand{
		id = 'KartBuilderAbout',
		title = 'About Kart Builder',
		group = 'help_about',
		onclick = function()
			about_dialog()
		end
	}

	plugin:newMenuSeparator{
		group = 'layer_popup_properties'
	}

	plugin:newMenuGroup{
		id = 'layer_popup_kart_builder',
		title = 'Kart Builder',
		group = 'layer_popup_properties'
	}

	plugin:newCommand{
		id = 'KartBuilderAutofill',
		title = 'Autofill',
		group = 'layer_popup_kart_builder',
		onclick = function()
			local result = skin_autofill()
			if errored(result) then
				local error = error_new('Error running autofill.', result)
				return dialog_error(error)
			end
		end
	}
end

-- Perform plugin shutdown.
function exit(plugin)

end
