#!/usr/bin/env bash

set -e

cmd=$(zenity --list --title "rigel DEマネージャー" --text="DEを選択してください。数分であなたに最適なデスクトップを提供します！" --column "操作" xfce GNOME KDE deepin )

if [ $cmd = 'xfce' ]; then
  zenity --progress --pulsate --text "xfceは非常にカスタマイズしやすく軽量で安定しています" & pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY apt install -y xubuntu-desktop


elif [ $cmd = 'GNOME' ]; then
  zenity --progress --pulsate --text "GNOMEは洗練されています。様々なDEのベースにもなっています" & pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY　apt-get install -y gnome-session


elif [ $cmd = 'KDE' ]; then
  zenity --progress --pulsate --text "KDEって意外と軽いんですよね。サクサク動きます" & pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY　apt install -y kubuntu-desktop kde-plasma-desktop kde-cong-screenlocker konsole kscreen language-pack-kde-ja


elif [ $cmd = 'deepin' ]; then
  zenity --progress --pulsate --text "Deepinは素晴らしいデスクトップ環境です。 by セットアップウィザード担当者" & pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY　add-apt-repository ppa:leaeasy/dde -y && pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY　apt update && pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY　apt install -y dde dde-le-manager deepin-gtk-theme


elif [ $cmd -z ]; then
  zenity --warning --title "通知" --text "ユーザーの意思によりプロセスが中断されました。このままxfceが使用されます。"

else 
  zenity --error --title "予期しないエラー" --text "例外が発生しました。これは致命的なエラーです。ご迷惑をお掛けして申し訳ありません。"
  exit 1
fi

zenity --info --title "done" --text "完了しました。別のDEにしたくなりましたか？ あなたはいつでもDEマネージャーを使用して新たなデスクトップ環境をセットアップできます！"
exit 0
