-- 用于从 DEVONthink 中生成我的博客中的《每周收藏与分享》文章，例如：https://blanboom.org/2019/201904/
-- 参考了如下脚本：http://forum.eastgate.com/t/script-to-export-certain-devonthink-metadata-in-a-tsv-for-tinderbox-import/1105

-- 用于匹配 DEVONthink 中文章的 tag，将文章放在合适的分类下，可根据实际需求修改
-- 最后一个空字符串用于匹配未加 tag 的文章，不要删除
property tagList : {"好奇心", "生活", "Making", "观点", "工具", "游戏", "技术", ""}

tell application id "DNtp"
	try
		set theSelection to the selection
		if theSelection is {} then error "请选中需要生成的文档"
		set theFile to choose file name default name "每月收藏与分享.markdown"
		
		set theMarkdown to my createMarkdown(theSelection)
		set thePath to POSIX path of theFile
		if thePath does not end with ".markdown" then set thePath to thePath & ".markdown"
		
		do shell script "echo " & quoted form of theMarkdown & ">" & quoted form of thePath
		
		hide progress indicator
	on error error_message number error_number
		hide progress indicator
		if the error_number is not -128 then display alert "DEVONthink Pro" message error_message as warning
	end try
end tell

on createMarkdown(theseRecords)
	local these_records_before, these_records_after
	local current_tag
	local this_record, this_markdown, this_tags, this_name, this_URL, this_comment
	tell application id "DNtp"
		set this_markdown to ""
		
		set these_records_before to {}
		set these_records_after to theseRecords
		
		repeat with current_tag in tagList
			
			-- 下一轮循环，只处理未处理过的 record
			set these_records_before to these_records_after
			set these_records_after to {}
			
			-- 设置一级标题
			set current_tag to current_tag as string
			
			if current_tag is equal to "" then
				set this_markdown to this_markdown & "# 其他" & return & return
			else
				set this_markdown to this_markdown & "# " & current_tag & return & return
			end if
			
			repeat with this_record in these_records_before
				set this_tags to (tags of this_record) as string
				
				if (this_tags contains current_tag) or (current_tag is equal to "") then
					
					-- 文章标题
					set this_name to name of this_record as string
					
					-- 为文章标题添加链接
					set this_URL to URL of this_record as string
					if this_URL begins with "http" then
						set this_name to "[" & this_name & "](" & this_URL & ")"
					end if
					
					-- 为文章标题添加对应的格式
					set this_markdown to this_markdown & "- **" & this_name & "**" & return & return
					
					-- 添加注释
					set this_comment to comment of this_record as string
					if this_comment is not equal to "" then
						set this_markdown to this_markdown & this_comment & return & return
					end if
				else
					set end of these_records_after to this_record
				end if
			end repeat
		end repeat
	end tell
	return this_markdown
end createMarkdown