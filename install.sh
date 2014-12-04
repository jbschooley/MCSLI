#!/bin/bash

# Don't change these variables!!!
dname=`dirname $0`
offline_java_version="1.8.0_25"
java_location="$dname/java"

clear
echo "Hey! I see you want to set up a Minecraft server. Good for you!"
echo
echo "Alright, here's how this works. If you see \"[1] blah blah blah\", type 1 and hit enter, and it will do blah blah blah. Same with \"[2] BLAH BLAH BLAH\" and so on. Ready?"
echo
echo "[1] Set up Minecraft server"
echo "[2] Never mind, I don't want to"
read ANSWER
echo
if [ "$ANSWER" == "1" ]; then
    echo "OK! Let's go!"
# install stuff here
    sudo update-alternatives --install /usr/bin/java java files/java/jre1.8.0_25/bin/java 100
    sudo update-alternatives --install /usr/bin/javac javac files/java/jre1.8.0_25/bin/javac 100
    java -version
elif [ "$ANSWER" == "2" ]; then
	echo "Never mind then. Bye!"
else
	echo "Oops, invalid answer. Please try again."
fi