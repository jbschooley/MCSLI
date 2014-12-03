#!/bin/bash

sudo update-alternatives --install /usr/bin/java java ~/MinecraftVPS/java/jdk1.8.0_25/bin/java 100
sudo update-alternatives --install /usr/bin/javac javac ~/MinecraftVPS/java/jdk1.8.0_25/bin/javac 100
java -version
