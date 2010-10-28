--
-- LocateByName
--
-- Created by Eric Nitardy
-- Copyright 2010. All rights reserved.
-- MIT License. Share freely.


tell application "System Events"
	activate
	set thePattern to text returned of (display dialog "Search for" default answer "")
	quit
end tell
if thePattern = "" then return
try
	set foundFiles to do shell script "mdfind -name " & quoted form of thePattern & " | /usr/bin/egrep -i " & quoted form of thePattern & "[^/]*/?$ | /usr/bin/grep -vi " & quoted form of thePattern & ".*" & quoted form of thePattern
on error
	set foundFiles to "Nothing Returned"
end try
if foundFiles = "" then set foundFiles to "Nothing Returned"

tell application "TextEdit"
	activate
	delay 0.5
	try
		set theDoc to document 1
		get text of theDoc
		if result is not "" then
			make new document
			set theDoc to result
		end if
	on error
		make new document
		set theDoc to result
	end try
	set text of theDoc to foundFiles
end tell
