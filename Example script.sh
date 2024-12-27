#!/bin/zsh

# If you wan to delay the start of the whole thing, un-comment this and setp the delay you want
#sleep 5

# Opens a konsole tab with the layout we saved,chane the [DIR] and [FILE].json sections accordingly
konsole --hold --fullscreen --layout [DIR]/[FILE].json & KPID=$!

# puts to sleep the programn to let the tabs to create
sleep 1

# Runs commands on startup, you can change those to whatever you want
qdbus org.kde.konsole /Sessions/1 org.kde.konsole.Session.runCommand 'clear'
qdbus org.kde.konsole /Sessions/1 org.kde.konsole.Session.runCommand 'neofetch'
qdbus org.kde.konsole /Sessions/3 org.kde.konsole.Session.runCommand 'spt'
qdbus org.kde.konsole /Sessions/4 org.kde.konsole.Session.runCommand 'btop'

# Renames the tabs, completely optional
qdbus org.kde.konsole-$KPID /Sessions/1 setTitle 1 'Neofetch'
qdbus org.kde.konsole-$KPID /Sessions/2 setTitle 1 'Main panel'
qdbus org.kde.konsole-$KPID /Sessions/3 setTitle 1 'Spotify'
qdbus org.kde.konsole-$KPID /Sessions/4 setTitle 1 'System monitor'

# Sets the using terminal to the top middle one
qdbus org.kde.konsole /Windows/1 setCurrentSession 2

# Sets konsole to fullscreen
qdbus org.kde.konsole /konsole/MainWindow_1/actions/fullscreen
