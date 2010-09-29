--
--  QsilverQscriptAppDelegate.applescript
--  QsilverQscript
--
--  Created by Eric Nitardy on 8/23/10.
--  Copyright 2010.
--  MIT License. Share freely.
--
property MyNSEvent : class "MyNSEvent"

--MyNSEvent's clickAtLocation_({x:100, y:100})

script QsilverQscriptAppDelegate
	property parent : class "NSObject"
	
	on applicationWillFinishLaunching_(aNotification)
		
		tell application "System Events"
			-- Assure Quicksilver is running			
			if not (exists (process "Quicksilver")) then
				try
					tell application "Quicksilver" to launch
					delay 5
				on error
					quit
				end try
			end if
			
			-- Assure Quickscript is running
			if not (exists (process "Axiotron Quickscript")) then
				try
					activate application "Axiotron Quickscript"
					delay 0.1
				on error
					quit
				end try
			end if
		end tell
		
		
		tell application "System Events"
			tell process "Axiotron Quickscript"
				set winCount to count of windows
				set {xPosition, yPosition} to position of window 1
			end tell
		end tell
		if winCount = 1 then -- If Quickscript has one window, it is hiding: so restart
			quit application "Axiotron Quickscript"
			delay 0.1
			activate application "Axiotron Quickscript"
			
		else
			-- Locate position for mouse click
			set {xPositionS, yPositionS} to {(xPosition + 10) as string, (yPosition + 10) as string}
			-- Make mouse click to slide out Quickscript
			MyNSEvent's clickAtLocation_({x:xPositionS, y:yPositionS})
			activate application "Axiotron Quickscript"
		end if
		
		-- Invoke Quicksilver with control space
		delay 0.01
		activate application "Quicksilver"
		--tell application "System Events" to set frontmost of process "Quicksilver" to true
		tell application "System Events" to keystroke space using control down
		delay 0.01
		-- Clear Quicksilver's dialog box with backspace
		tell application "System Events" to tell process "Quicksilver" to key code 51
		
		quit
		
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		return true
		--return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script