ruby-auto-resize-plist-for-texturepacker
========================================

## 概要

TexturePackerで生成したPlistファイルを一括スケールするためのスクリプト。

Cocos2d-xでは、パフォーマンス向上のためにTexturePackerを利用することが多いが、タブレット版とスマートフォン版など複数サイズのリソースを用いる場合、その都度、各スケール毎のテクスチャを生成する必要がある。その手間が「あぁ面倒くさい・・」、という人向けのRubyスクリプト。

## 使い方

```
[]$ ruby auto_resize_plist.rb
Usage: auto_resize_plist.rb <plists-dir> <scale>
  <plists-dir> : ex) Resouces/large/*.plist
  <scale>      : ex) 1/2
  <output-dir> : ex) Resouces/small/
```

## 実行例

```
// Resuces/largeファルダ以下のplistをスケールする場合
[]$ ruby auto_resize_plist.rb Resources/large/*.plist 1/2 

// Resuces/largeファルダ以下のplistのスケールしてsmallフォルダにアウトプットする場合
[]$ ruby auto_resize_plist.rb Resources/large/*.plist 1/2 Resouces/small/
```

