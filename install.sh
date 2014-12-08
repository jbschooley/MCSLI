#!/bin/bash

# Don't change these variables!!!
dname=`dirname $0`
offline_java_version="1.8.0_25"
offline_minecraft_version
java_location="$dname/.files/java/jre$offline_java_version"
minecraft_location="$dname/.files/mcserver"

main() {
	clear
	echo "Hey dude! I see you want to set up a Minecraft server. Swag!"
	echo
	echo "Alright, here's how this works. If you see \"[1] blah blah blah\", type 1 at the prompt and hit enter, and it will do blah blah blah. Same with \"[2] BLAH BLAH BLAH\" and so on. Ready?"
	echo
	echo "[1] Set up Minecraft server"
	echo "[2] Never mind, I don't want to"
	echo -n "> "
	read answer
	echo
	if [ "$answer" == "1" ]
	then
		setup
	elif [ "$answer" == "2" ]
	then
		echo "Never mind then. Bye!"
	else
		echo "Oops, invalid answer. Please try again."
		main
	fi
}

setup() {
	if [ "$(id -u)" = "0" ]
		then
			echo "OK! Let's go!"
			echo
			echo "You need Java to run a Minecraft server. Let me check if it's installed..."
			checkJava
			# install stuff here
			# sudo update-alternatives --install /usr/bin/java java .files/java/jre1.8.0_25/bin/java 100
		else
			echo "Oops! You need to run this script with root permissions. Please try \"sudo ./install.sh\"."
			exit 1
		fi
}

checkJava() {
	which java > /dev/null
	if [ $? == 0 ]
	then
		installed_java_version=`java -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
		echo "Good, it looks like you have version $installed_java_version."
	else
		echo "I can't find a version of Java installed. Would you like to install it?"
		echo
		echo "[1] Yes"
		echo "[2] No"
		echo -n "> "
		read answer
		echo
		if [ "$answer" == "1" ]
		then
			installJavaMain
		elif [ "$answer" == "2"]
		then
			echo "Sorry, you can't use Minecraft without Java. The script will now exit."
		exit 2
		fi
	fi
}

installJavaMain() {
	echo "Would you like to install the version bundled with this script ($offline_java_version) or would you like to download and install the latest version from Oracle?"
	echo
	echo "[1] Install version $offline_java_version"
	echo "[2] Download and install the latest version"
	echo -n ">"
	read answer
	echo
	if [ "$answer" == "1" ] 
	then
		if [ $(uname -m) == "x86_64" ]
		then
			echo "OK, installing version $offline_java_version..."
			installJava "$dname/.files/java/x64/jre$offline_java_version" "jre$offline_java_version"
		else
			echo "OK, installing version $offline_java_version..."
			mkdir -p /opt/oracle/java/jre
			cp -r .files/java/x86/jre$offline_java_version /opt/oracle/java/
			update-alternatives --install /usr/bin/java java /opt/oracle/java/jre$offline_java_version/bin/java 100
		fi
	elif [ "$answer" == "2" ]
	then
		echo "OK, downloading and installing latest version of java..."
		mkdir -p /opt/oracle/java/jre
		download "http://javadl.sun.com/webapps/download/AutoDL?BundleId=97358"
	fi
}

installJava() {
	local javadir=$1
	local 
	mkdir -p /opt/oracle/java/jre
	cp -r $javadir /opt/oracle/java/
	update-alternatives --install /usr/bin/java java /opt/oracle/java/jre$offline_java_version/bin/java 100
}

download() {
    local url=$1
    echo -n "    "
    wget --progress=dot $url 2>&1 | grep --line-buffered "%" | \
        sed -u -e "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
    echo -ne "\b\b\b\b"
    echo " DONE"
}

main