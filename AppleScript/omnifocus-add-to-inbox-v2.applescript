-- https://blanboom.org/2014/omnifocus-quick-entry-applescript-v2/

set tmp to display dialog "What do you want to do?" default answer ""
set taskString to text returned of tmp

set isRunning to false
tell application "System Events"
    if exists process "OmniFocus" then
        set isRunning to true
    end if
end tell

if isRunning is true then
    tell application "OmniFocus"
        tell front document
            make new inbox task with properties {name:(taskString)}
        end tell
    end tell
else
    tell application "OmniFocus" to activate

    tell application "OmniFocus"
        tell front document
            make new inbox task with properties {name:(taskString)}
        end tell
    end tell
end if