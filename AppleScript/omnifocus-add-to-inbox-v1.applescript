-- https://blanboom.org/2014/omnifocus-quick-entry-applescript/

set isRunning to false

tell application "System Events"
    if exists process "OmniFocus" then
        set isRunning to true
    end if
end tell

if isRunning is true then
    tell application "System Events"
        keystroke " " using {control down, option down}
        -- ?? Qiuck Entry ???
    end tell
else
    tell application "OmniFocus" to activate

    tell application "OmniFocus"
        set miniaturized of window 1 to true
    end tell

    tell application "System Events"
        keystroke " " using {control down, option down}
        -- ?? Qiuck Entry ???
    end tell
end if