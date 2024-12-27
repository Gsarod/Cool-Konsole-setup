# Cool Konsole setup

![image](https://github.com/user-attachments/assets/08b720c3-22e1-4ed3-96f5-1545e5decbdc)




# Ricing
The purpose of this is just to show what I can do. \
If someone sees this and wants to try to do the same, aknownledge that this isn't a proper tutorial but you can still use it at your own risks.  

**Getting started**

# Packets needed
>You'll need to install some packets with your packet manager, pacman if you're on Arch for example.

`sudo pacman -S --needed neofetch zsh cowsay qt5-tools btop konsole`

>And some from the AUR for my case, I don't know how to get them for other distros

**Spotify-tui** : a CLI based spotify client. Credits to Riguellute :\
https://github.com/Rigellute/spotify-tui

>Some are github repos 

**Oh my zsh** : A customisation tool for zsh. 
I follwowed this tutorial by Novaspirit tech : \
https://www.youtube.com/watch?v=80PHRWH84Tc&t=444s \
🛑 In his tutorial he uses 'sudo apt', just use sudo pacman -S if you're on Arch 💡 \

# Configuration 

Now that everything needed ins installed, it's time to rice our terminal

**Setup the konsole layout** 

Pretty straightforward, just open konsole add & arrange terminals to your liking, then presse shift+F10 to bring up a menu then naviagte te More/View/Save tab layout. \
>Name it however you like and save it somewhere you'll remember it, I saved it in a folder toghether with a shell script for clarity. \

**Make a shell script to launch the layout**

Now that we got the layout done, we can use a shell script to automate the setup. Here is an for the example layout : 

```shell
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
```
Then use `chmod +x [DIR TO SH FILE]` to make it executable. 
>Save this file with the .sh suffix somewhere you'll remember it

***Optional steps***

**Make your terminal say something when you launch a new tab**

To do that, edit your `.zshrrc` file in your home directory by adding at the very bottom a cowsay command : \
`nano /home/[USER]/.zshrc`


If you want the eyes from this tutorial, you can add : 
```shell
cowsay -f eyes "I'm hungry"
```

**Configure neofetch**

If you want to change how it looks you can tweak the neofetch .conf file, access it with 
`cd /home/gsarod/.config/neofetch/` 

Then use your prefered text editor to edit the config.conf file\
`nano ./config.conf` 

There are plenty of tutorials out there, i used this one for example \
https://linuxopsys.com/customize-neofetch \
🛑 DON'T DO ANYTHING IF YOU DON'T KNOW WHAT YOU ARE DOING🛑

# Run the whole thing 

`sh [DIR TO SH FILE]`

# OPTIONAL 

I only kow how to do it in KDE, but if you want it to run when you start, go in your Settings -> Autostart -> Add new Login script then select your shell file 


# 🛑 CAUTION 🛑

**DO NOT CHANGE YOUR KONSOLE SETTINGS TO RUN IT WHEN YOU START A NEW TAB** it will just create a feedback loop that will create infinite tabs and freeze your PC, so just don't. 






