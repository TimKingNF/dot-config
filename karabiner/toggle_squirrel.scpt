on changeKeyboardLayout(layoutName)
	tell application "System Events"
		tell application process "TextInputMenuAgent"
			tell menu bar item 1 of menu bar 2
				tell menu 1
					tell menu item layoutName
						click
					end tell
				end tell
			end tell
		end tell
	end tell
	tell application "System Events" to ¬
		tell application process "TextInputMenuAgent" to ¬
			click menu bar item 1 of menu bar 2
end changeKeyboardLayout

-- https://apple.stackexchange.com/questions/376922/switch-to-a-specific-input-source-in-os-x-in-catalina-with-applescript

changeKeyboardLayout("Squirrel")