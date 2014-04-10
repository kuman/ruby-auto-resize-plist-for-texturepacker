#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#
# Plistのスケールするためのスクリプト
#
# Usage: auto_resize_plist.rb <plists-dir> <scale>
#   <plists-dir> : ex) Resouces/large/*.plist
#   <scale>      : ex) 1/2
#   <output-dir> : ex) Resouces/small/
#
# Example:
#   // Resuces/largeファルダ以下のplistをスケールする場合
#   []$ ruby auto_resize_plist.rb Resources/large/*.plist 1/2 
#
#   // Resuces/largeファルダ以下のplistのスケールしてsmallフォルダにアウトプットする場合
#   []$ ruby auto_resize_plist.rb Resources/large/*.plist 1/2 Resouces/small/
#
# Memo:
#   - <string>の数値を指定した値で掛けるだけ。
#   - 端数がある場合、微妙にズレが生じる可能性がある。
#   - 元のテクスチャ画像の横幅を工夫する必要がある。
#

# 引数を確認する
if ARGV[0].nil? || ARGV[1].nil?
    print "[ERROR] arguments not found.\n"
    print "usage: auto_resize_plist.rb <plists-dir> <scale> <output-dir>\n"
    print "   <plists-dir> : ex) Resouces/large/*.plist\n"
    print "   <scale>      : ex) 1/2\n"
    print "   <output-dir> : ex) Resouces/small/\n"
    exit
end

# 引数を取得する
plist_path = ARGV[0]
scale_str  = ARGV[1]
output_dir = ARGV[2].nil? ? Dir.pwd : ARGV[2]

# スケール実行
Dir::glob(plist_path).each {|file|
    filename = File.basename(file)
    p "* Create scale plist '#{filename}' #{scale_str} times"
    new_plist = "";
    open(file).each do |line|
        if line.include?('<string>')
            new_plist << line.gsub(/[0-9]+/) do |num|
                (num.to_i * scale_str.to_c.to_f).round(1)
            end
        else
            new_plist << line
        end
    end
    new_file = open("#{output_dir}/#{filename}", "w")
    new_file.write(new_plist)
}
