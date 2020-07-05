-- 在 macOS 上批量删除 iMessage 消息
tell application "Messages"
	activate
	tell application "System Events"
        -- 重复 50 次，即删除 50 个会话，可根据需要修改删除的条数
		repeat 50 times
			key code 40 using {command down, option down}
			key code 36
		end repeat
	end tell
end tell
