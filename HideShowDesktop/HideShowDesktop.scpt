try
 set myAnswer to ((do shell script "defaults read com.apple.finder CreateDesktop") as integer) as boolean
on error
 do shell script "defaults write com.apple.finder CreateDesktop 1"
 set myAnswer to true
end try
do shell script "defaults write com.apple.finder CreateDesktop " & (((not myAnswer) as integer) as string)
tell application "Finder" to quit
delay 1
tell application "Finder" to launch