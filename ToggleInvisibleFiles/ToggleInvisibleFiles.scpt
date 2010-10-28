try
	set ShowAllFiles to do shell script "defaults read com.apple.finder AppleShowAllFiles -bool" as boolean
on error
	set ShowAllFiles to false
end try

if ShowAllFiles is true then
	do shell script "defaults delete com.apple.finder AppleShowAllFiles;killall Finder"
else
	do shell script "defaults write com.apple.finder AppleShowAllFiles -bool YES;killall Finder"
end if