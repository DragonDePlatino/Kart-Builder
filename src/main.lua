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

	local groups = { 'layer_popup_properties', 'cel_popup_properties' }
	for _, group in ipairs(groups) do
		plugin:newMenuSeparator{
			group = group
		}
	
		plugin:newMenuGroup{
			id = group .. '_kart_builder',
			title = 'Kart Builder',
			group = group
		}
	
		plugin:newCommand{
			id = 'KartBuilderAsymmetrize',
			title = 'Asymmetrize',
			group = group .. '_kart_builder',
			onclick = command_asymmetrize
		}
	
		plugin:newCommand{
			id = 'KartBuilderAutofill',
			title = 'Autofill',
			group = group .. '_kart_builder',
			onclick = command_autofill
		}
	end

	
end

-- Run an asymmetrize command.
function command_asymmetrize()
	local result = skin_asymmetrize()
	if errored(result) then
		local error = error_new('Error running asymmetrize.', result)
		return dialog_error(error)
	end
end

-- Run an autofill command.
function command_autofill()
	local result = skin_autofill()
	if errored(result) then
		local error = error_new('Error running autofill.', result)
		return dialog_error(error)
	end
end

-- Perform plugin shutdown.
function exit(plugin)

end
