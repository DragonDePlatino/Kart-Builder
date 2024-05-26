dofile 'plugin.lua'

function about_dialog()
	local dialog = Dialog{ title = 'About Kart Builder'}
	dialog:label{ label = 'Kart Builder v' .. plugin_version }
	dialog:label{ label = 'A kart-editing suite for Dr. Robotnik\'s Ring Racers' }
	dialog:label{ label = 'https://github.com/DragonDePlatino/Kart-Builder' }
	dialog:label{ label = 'Created by: DragonDePlatino' }
	dialog:button{ text = '    Close    ', hexpand = false }
	dialog:show()
end
