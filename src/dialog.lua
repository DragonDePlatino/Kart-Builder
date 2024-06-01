dofile 'plugin.lua'

-- Property to set each type of dialog entry.
local property_value = {
	check		= 'selected',
	color		= 'color',
	combobox	= 'option',
	entry		= 'text',
	file		= 'filename',
	radio		= 'selected',
	shades		= 'colors',
	slider		= 'value'
}

-- Open dialog with specified set of properties.
function dialog_properties(dialog, properties, buttons, object)
	local data = plugin_properties_unpack(object, properties)

	-- Organize properties into tabs.
	local tabs = {}
	for _, property in ipairs(properties) do
		local tab = table_find(tabs, function(tab) return tab.name == property.tab end)
		if tab == nil then
			tabs[#tabs + 1] = { name = property.tab, properties = { property } }
		else
			tab.properties[#tab.properties + 1] = property
		end
	end

	for i, tab in ipairs(tabs) do
		
		if tab.name ~= nil then
			-- Create new tab.
			dialog:tab({
				id = tab.name,
				text = tab.name
			})
		elseif i == #tabs then
			-- Add footer properties.
			dialog:endtabs()
		end

		-- Create control for each property.
		for _, property in ipairs(tab.properties) do
			if property.count == nil then
	
				property.onchange = function()
					local value = dialog.data[property.id]
					
					if type(value) == 'userdata' and value.index ~= nil then
						value = value.index
					end

					object.properties(plugin_key)[property.id] = value
					if property.changed then property.changed(dialog) end
				end
	
				dialog[property.type](dialog, property)
			else
				local prefix = property.id
				for i = 1, property.count do
					property = table_copy(property)
					if i > 1 then property.label = nil end
					property.id = prefix .. i
	
					property.onchange = function()
						local value = object.properties(plugin_key)[prefix]
						value[i] = dialog.data[prefix .. i]
						object.properties(plugin_key)[prefix] = value
						if property.changed then property.changed(dialog) end
					end
	
					dialog[property.type](dialog, property)
				end
			end
		end
	end

	-- Add all buttons.
	for _, property in ipairs(buttons) do
		dialog[property.type](dialog, property)
	end

	-- Perform initial update of properties.
	dialog.data = data
	for _, property in ipairs(properties) do
		if property.changed then
			property.changed(dialog)
		end
	end

	-- Show dialog and return result.
	dialog:show()
	return dialog.data
end

-- Show an error dialog.
function dialog_error(error)
	local dialog = Dialog{ title = 'Kart Builder' }
	
	-- Append each label to dialog.
	dialog_error_append(dialog, error.error)

	-- Show error dialog.
	dialog:button{ text = '    Close    ', hexpand = false }
	dialog:show()

	if error.suberror ~= nil then
		-- Show additional error dialogs.
		dialog_error(error.suberror)
	end
end

-- Recursively append labels to error dialog.
function dialog_error_append(dialog, label)
	if type(label) == 'string' then
		dialog:label{ label = label }
		return
	end

	for i, label in ipairs(label) do
		dialog_error_append(dialog, label)
	end
end
