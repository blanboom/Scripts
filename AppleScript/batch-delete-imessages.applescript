-- �� macOS ������ɾ�� iMessage ��Ϣ
tell application "Messages"
	activate
	tell application "System Events"
        -- �ظ� 50 �Σ���ɾ�� 50 ���Ự���ɸ�����Ҫ�޸�ɾ��������
		repeat 50 times
			key code 40 using {command down, option down}
			key code 36
		end repeat
	end tell
end tell
