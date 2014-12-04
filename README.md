MCSLI: Minecraft Server Linux Installer
============

Use this to easily install Java and a Minecraft server on a Linux server.

```shell
wget https://github.com/silvertriclops/MinecraftVPS/archive/master.zip
unzip master.zip
```

Currently this only works on Debian/Ubuntu. If you want to use it on Fedora/SUSE, you'll need to make some changes to install.sh.

TO DO LIST:
- [ ] Fedora/SUSE support
- [ ] Option to install Java to /opt/oracle/java/jre (or a specified directory)
- [ ] Option to install the Minecraft server to /opt/mcserver (or a specified directory)
- [ ] Option to download the latest version of Java and the Minecraft server before installation
- [ ] Change a few permissions