# Welcome to TeQA Alpine v 0.1.0!
                                                     
TeQA mean Termux, Qemu and Alpine. TeQA builder/pre installed Alpine Image disk with basic esential function.

# Requirements :

1. Device Android OS with arm64 architecture

2. Termux 

you need to install it manually from Fdroid https://f-droid.org/id/packages/com.termux/ . install Version 0.118.1 stable version. dont install Termux from Playstore because Termux Playstore are deprecated and no longer suported for newer device and Android OS.

3. Qemu Emulator cli (core and utilities)

auto install during installation.

4. p7zip cli

auto install during installation.

5. 500MB free disk space.

# Installation :

1. run Termux
2. install git client for Termux (optional but recommended)

pkg update && pkg install git -y

3. inside your termux Home directory. you can type "cd" to jump to Termux home. type "pwd" to check if its already in home dir (/data/data/com.termux/files/home). clone this project repo.

via Termux git client (recommended) : 

git clone https://github.com/hayinfx/teqa.git

if you cant install git client or error while copy this repo with git command, download repo manually with wget.

via Termux wget and unzip : 

pkg update && pkg install -y unzip && pkg install -y wget unzip && wget -O - https://github.com/hayinfx/teqa/archive/refs/heads/main.zip | unzip -

last but not least, you can download archive manualy via https://github.com/hayinfx/teqa/archive/refs/heads/main.zip , move zip file to root internal sdcard with file manager , and run Termux command bellow :

pkg install -y unzip && unzip /storage/emulated/0/main.zip -d ~/ 

4. cd into teqa folder with "cd teqa" or "cd ~/teqa" 

5. inside teqa folder run command "sh install.sh" or "sh ./install.sh".

6. follow instruction during installtion process.

feel free to submit any question, problem, or sugestion here https://github.com/hayinfx/teqa/discussions
