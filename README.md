本 repository 主要用于整理自己日常使用的脚本。

## AppleScript

### devonthink-to-markdown.applescript

参考： [使用 DEVONthink 和 AppleScript 完成稍后读，并快速分享阅读内容到博客](https://blanboom.org/2019/devonthink-to-markdown/)

### omnifocus-add-to-inbox-v2.applescript

参考：[OmniFocus 快速收集脚本 v2 – Blanboom](https://blanboom.org/2014/omnifocus-quick-entry-applescript-v2/)

### omnifocus-add-to-inbox-v1.applescript

参考：[OmniFocus 快速收集脚本 – Blanboom](https://blanboom.org/2014/omnifocus-quick-entry-applescript/)

### batch-delete-imessages.applescript

在 macOS 上批量删除 iMessage 信息

## Bash

###  timemachine_cleanup

批量清理 Time Machine 中较旧的备份

参考： [如何更好地清理 Time Machine 备份 – Blanboom](https://blanboom.org/2020/timemachine-cleanup/)

```
# 清除 30 天前的**所有**旧备份：
sudo ./tmcleanup.sh /Volumes/Time\ Machine\ Backups/Backups.backupdb my_computer_name 30

# 清除 30 天前的旧备份（保留一半）：
sudo ./tmcleanup_50percent.sh /Volumes/Time\ Machine\ Backups/Backups.backupdb my_computer_name 30
```

### add_shadow_to_image

为图片增加阴影

### upgrade_all

批量进行 Homebrew、Mac App Store、pip、npm 等的更新

### logseq_yesterday_todo_transfer_to_today

将 Logseq 昨天日志中的待办事项转移到今天

参考：[将 Logseq 的昨日待办事项自动转移到今天 – Blanboom](https://blanboom.org/2023/logseq-yesterday-todo-transfer-to-today/)

## Scriptable

### StockWidget.js

![StockWidget](Images/stockwidget2.jpeg)

原脚本来自此处：[https://gist.github.com/saiteja09/52f15d4b4f30657af51a1336661884a8](https://gist.github.com/saiteja09/52f15d4b4f30657af51a1336661884a8)

iOS 自带的股市 Widget，一个 Widget 中只能显示三个股票的信息。本脚本能够更密集地、显示更多（10 个以上）的股票信息。

## Python

### readwise_reader_to_cubox.py

将 [Readwise Reader](https://readwise.io/read) 中的文章导出到 [Cubox](https://cubox.pro)。

```
usage: readwise_reader_to_cubox.py [-h] [--debug] api_token csv_file

Import Readwise Reader bookmarks to Cubox

positional arguments:
  api_token   Cubox API token
  csv_file    Path to the CSV file

options:
  -h, --help  show this help message and exit
  --debug     Print HTTP requests without sending them
```

## 使用方法

```
git clone git@github.com:blanboom/Scripts.git Scripts
cd Scripts
git submodule init
git submodule update
```