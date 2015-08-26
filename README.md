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


# Automated start-up & deport all your fat stuff


## Configure

Replace path line 2 of .zshrc and line 1 of .start.sh by your mount path afp on mac

On mac zshrc:
```shell
source /Volumes/[myMountName]/.start.sh
```

In following examples i use the eval shell commande for resolve dynamically HOLD_HOME path because it can change in my case frequently (for 42 student), but if you have a fixe path, please delete him, is not realy a good practice in all cases.

Dont forget to edit AFP_HOME variable with your proper mount path


### On server home .start.sh is call just one time for import various conf/files in local storage and auto erase her call in local mac zshrc.
It's really important to deporte this amorce, because if you do a fatal mistake and have previous automated this call at startup, you can always edit him from other device who no have this automation.

```shell
AFP_HOME="/Volumes/[My AFP Mount]"

MAC_HOME="/nfs/zfs-student-*/users/201[0-9]/`whoami`"
MAC_HOME=`eval echo ${MAC_HOME}`

#import and execute distant zshrc
pkill -u `whoami`
echo -n "source $AFP_HOME/.zshrc" > $MAC_HOME/.zshrc
source $AFP_HOME/.zshrc

#get .brew
rm -rf $MAC_HOME/.brew
cp -pXRf $AFP_HOME/.brew $MAC_HOME/.brew

#get atom
rm -rf $MAC_HOME/.atom
cp -pXRf $AFP_HOME/.atom $MAC_HOME/.atom

#fix brew
mkdir -p $MAC_HOME/Library/Caches/Homebrew

```

# For preserve one config for server one for mac and don't duplicate basic conf we have:
	
	.cfgMac.sh  -- Load once on mac
	.cfgServer.sh -- Load once where i ssh
	.cfgAllSys.sh -- Load all time
	
	.zshrc -- Load the good cfg server/mac and load cfgAllSys 

.zshrc (in server home):
```shell
if [[ "$(uname)" == "Darwin" ]]; then
  source /Volumes/afp177/.cfgMac.sh
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
  source /home/luperez/.cfgServer.sh
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
  echo "What do you fuck dude ?"
fi

source $HOME/.cfgAllSys.sh
source $HOME/.identity.sh
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
