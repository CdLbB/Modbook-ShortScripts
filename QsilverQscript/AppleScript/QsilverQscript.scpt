--
--  QsilverQscriptAppDelegate.applescript
--  QsilverQscript
--
--  Created by Eric Nitardy on 8/23/10.
--  Copyright 2010.
--  MIT License. Share freely.
--


-- Assure Quicksilver is running
tell application "System Events"
	if not (exists (process "Quicksilver")) then
		tell application "Quicksilver" to launch
		delay 5
	end if
end tell


-- Restart Quickscript 
try
	quit application "Axiotron Quickscript"
	delay 0.1
end try
activate application "Axiotron Quickscript"

-- Invoke Quicksilver with control space
delay 0.01
activate application "Quicksilver"
--tell application "System Events" to set frontmost of process "Quicksilver" to true
tell application "System Events" to keystroke space using control down
delay 0.01
-- Clear Quicksilver's dialog box with backspace
tell application "System Events" to tell process "Quicksilver" to key code 51
