#!/bin/sh

# 作成ファイルパス
OUTPUT_FILE="${SRCROOT}/Flutter/DartDefines.xcconfig"

# Flutter 2.2 以降で必要な、Dart-Defineのデコード処理 
function decode_url() { echo "${*}" | base64 --decode; }

# あらかじめファイル内容を空にする
: > $OUTPUT_FILE

IFS=',' read -r -a define_items <<<"$DART_DEFINES"

for index in "${!define_items[@]}"
do
    # Flutter 2.2 以降で必要なデコードを実行する
    item=$(decode_url "${define_items[$index]}")
    # FLAVORが含まれるDart Defineの場合
    if [ $(echo $item | grep 'FLAVOR') ] ; then
        # FLAVORの値(=の右側)
        value=${item#*=}
        # FLAVORに対応したXCConfigファイルをincludeさせる
        echo "#include \"$value.xcconfig\"" >> $OUTPUT_FILE
    fi
done
