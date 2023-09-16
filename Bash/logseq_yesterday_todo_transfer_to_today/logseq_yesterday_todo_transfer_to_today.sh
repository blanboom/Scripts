#!/bin/bash

yesterday=$(date -d "yesterday" "+%Y_%m_%d")
today=$(date "+%Y_%m_%d")

input_file="${yesterday}.md"
output_file="${today}.md"
temp_file="temp.md"

awk '
BEGIN { RS = "\n"; FS = "\n"; ORS = "\n"; print_flag = 0; }
{
    # 确定哪些 block 从昨天转移到今天。可根据自己的使用习惯修改此处
    if ($1 ~ /^- (TODO|DOING)/) {
        print_flag = 1;
    } else if ($1 ~ /^- /) {
        print_flag = 0;
    }
    if (print_flag == 1) {
        print $0 >> "'"$output_file"'";
    } else {
        print $0 > "'"$temp_file"'";
    }
}
' "$input_file"

mv "$temp_file" "$input_file"