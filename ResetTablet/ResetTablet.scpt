--
-- ResetTablet
--
-- Created by Eric Nitardy
-- Copyright 2010. All rights reserved.
-- MIT License. Share freely.


-- Determine tablet driver's correct application name. Two methods provided.
-- First if process is running, second if not.
tell application "System Events"
	set tabletDrivers to every process whose (name contains "TabletDriver" and name is not "TabletDriver")
end tell
if tabletDrivers is {} then
	-- tablet driver process is not running, so ...
	try
		set AppScriptDriver to "TabletDriver"
		set tabletPath to path to application AppScriptDriver
		tell application "Finder"
			set tabletApp to name of folder of folder of folder of tabletPath
		end tell
		set PenTabletDriverName to name of application tabletApp
		tell application PenTabletDriverName to launch
		
	on error -- Both methods for finding tablet driver's app name failed, so ...
		tell current application
			activate
			display alert "No TabletDriver running." message "Perhaps this system is not attached to a Wacom Pen Tablet. Nonetheless, this Application cannot launch." as warning
		end tell
		quit
	end try
else -- tablet driver process IS running, so ...
	set PenTabletDriverName to name of item 1 of tabletDrivers
end if


-- resetTabletDriver
	try
		do shell script "killall " & quoted form of PenTabletDriverName
	on error
		try
			do shell script "killall -9 " & quoted form of PenTabletDriverName
		end try
	end try
	delay 0.2
	tell application PenTabletDriverName to launch
	



