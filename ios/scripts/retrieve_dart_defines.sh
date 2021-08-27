#!/bin/sh

# 作成ファイルパス
OUTPUT_FILE="${SRCROOT}/Flutter/DartDefines.xcconfig"

# Flutter 2.2 以降で必要な、Dart-Defineの変換処理 
function decode_url() { echo "${*}" | base64 --decode; }

# あらかじめファイル内容を空にする
: > $OUTPUT_FILE

IFS=',' read -r -a define_items <<<"$DART_DEFINES"

for index in "${!define_items[@]}"
do
    # Flutter 2.2 以降で必要なエンコードを実行する
    item=$(decode_url "${define_items[$index]}")
    # FLAVORが含まれるDart Defineの場合
    if [ $(echo $item | grep 'FLAVOR') ] ; then
        # XCConfigファイルに書き込み
        echo $item >> $OUTPUT_FILE
        # FLAVORの値
        value=${item#*=}
        # AppIcon用Suffix
        echo ICON_SUFFIX=-${value} >> $OUTPUT_FILE
        # Production環境以外の場合にBundle IDのSuffixを設定する
        if [ $(echo $item | grep -v 'prod') ] ; then
            echo FLAVOR_SUFFIX=.${value} >> $OUTPUT_FILE
        fi
    fi
done
