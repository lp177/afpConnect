# afpConnect
Switch your mac home directory with a distant mounted partition on a dedicate server with the afp protocol.


## Server configuration

  Create a new user for this usage (sudo useradd NewName)
  Package required: netatalk libc6-dev avahi-daemon libnss-mdns
  You need to configure various files, most tutorial and documentations exist on it, good read.
  
[Tuto on kremalicious.com for exemple](https://kremalicious.com/ubuntu-as-mac-file-server-and-time-machine-volume/)

[Official documentation of netatalk](http://netatalk.sourceforge.net/3.1/htmldocs/)

(Give me better than it for add that here if you found)


## Finder configuration

  Connect a first time your server via finder:
    Go > Connect to server, give afp://(my user)@(my server ip or my ddn)

  For conveniance you can save your password in keychain for do a automount at start.

  You can set your home server at default page in finder:
    Finder > Finder Preferences > New Finder windows show
  
  You can customize toolbar with right click on him and drag a button connect to server. 
  
  And finnaly linck yours shells settings (zshrc, vimrc, homyzsh ...)
    With set the env variable HOME at the new path home.
    For example i can tipe in shell export HOME=/Volumes/myMountName

  Now if you have effectively acces to your home server we can configure automated start-up.
  
## Automated start-up


On mac zshrc:
```shell
source /Volumes/myMountName/.start.sh
```

In following examples i use the eval shell commande for resolve dynamically HOLD_HOME path because it can change in my case frequently, but if you have a fixe path, please delete him, is not realy a good practice in all cases.

Dont forget to edit MOUNT variable with your proper mount path


### On server home .start.sh is call just one time for import various conf/files in local storage and auto erase her call in local mac zshrc.
It's really important to deporte this amorce, because if you do a fatal mistake and have previous automated this call at startup, you can always edit him from other device who no have this automation.

```shell
MOUNT="/Volumes/myMountName"

HOLD_HOME="/nfs/zfs-student-*/users/20[0-9][0-9]/`whoami`"
HOLD_HOME=`eval echo ${HOLD_HOME}`

#import and execute distant zshrc
pkill -u `whoami`
echo -n "source $MOUNT/.z42.sh" > $HOLD_HOME/.zshrc
source $MOUNT/.z42.sh

#get .brew
rm -rf $HOLD_HOME/.brew
cp -pXRf $MOUNT/.brew $HOLD_HOME/.brew
```

## On server home .z42.sh is my definitive zshrc (I dont put that on my .zshrc server for preserve one to linux server and one to mac desktop):

```shell
MOUNT="/Volumes/myMountName"

HOLD_HOME="/nfs/zfs-student-*/users/20[0-9][0-9]/`whoami`"
HOLD_HOME=`eval echo ${HOLD_HOME}`

export HOME=$MOUNT

export PATH=$HOLD_HOME/.brew/bin:$PATH_BASE
export HOMEBREW_TEMP=/tmp
export HOMEBREW_PREFIX=$HOLD_HOME/.brew;
export HOMEBREW_CELLAR=$HOLD_HOME/.brew/Cellar;

alias sysinfo="system_profiler SPSoftwareDataType"

alias goserv="
	export HOME=$MOUNT;
	cd
"

alias gomac="
	export HOME=$HOLD_HOME;
	cd
"

alias e42="
	gomac;
	rm -rf .Trash .duty .ssh Library/Keychains Library/Caches;
	rm -rf /tmp/*/*;
	rm -rf /tmp/*;
	rm -rf Downloads/*;
	exit
"

#Unactive .DS_Store on shared DD
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

alias showMeTruth="defaults write com.apple.finder AppleShowAllFiles -boolean true;killall Finder"

alias e42="gomac;rm -rf .Trash .duty .ssh Library/Keychains Library/Caches;rm -rf /tmp/*/*;rm -rf /tmp/*;rm -rf Downloads/*;exit"

```



Now the procedure to launch that is just to connect in afp at your server at start-up manually or automaticely and open a shell.

Have a nice day.
