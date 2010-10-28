set runningApps to "" as string
set frontmostApp to "" as string

tell application "System Events"
	set runningApps to the name of every process whose background only is false
	repeat with p in runningApps
		if process p is frontmost then
			set frontmostApp to p
			exit repeat
		end if
	end repeat
end tell

tell application "Axiotron Quickclicks"
	Show Keyboard
	Hide Keyboard
	Show Keyboard
	delay 0.1
	Hide Keyboard
	Show Keyboard
	delay 0.1
	Hide Keyboard
	Show Keyboard
end tell

tell application frontmostApp
	activate
end tell
