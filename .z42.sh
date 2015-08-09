MOUNT="/Volumes/myMountName"
HOLD_HOME="/nfs/zfs-student-*/users/20[0-9][0-9]/`whoami`"
HOLD_HOME=`eval echo ${HOLD_HOME}`
ZSHRC="(.z42.sh|.zshrc)"

export HOME=$MOUNT
export PATH="$MOUNT/.brew/bin:$PATH_BASE"
export HOMEBREW_TEMP="/tmp"

alias goserv="
	export HOMEBREW_PREFIX="$MOUNT/.brew";
	export HOMEBREW_CELLAR="$MOUNT/.brew/Cellar";
	export PATH="$MOUNT/.brew/bin:$PATH_BASE";
	export HOME=$MOUNT;
	cd
"
alias gomac="
	export HOMEBREW_PREFIX="$HOLD_HOME/.brew";
	export HOMEBREW_CELLAR="$HOLD_HOME/.brew/Cellar";
	export PATH="$HOLD_HOME/.brew/bin:$PATH_BASE";
	export HOME=$HOLD_HOME;
	cd
"

alias vz="vim ~/$ZSHRC"
alias sz="source ~/$ZSHRC"
alias cz="cat ~/$ZSHRC"

#Unactive .DS_Store on shared DD
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

alias showMeTruth="defaults write com.apple.finder AppleShowAllFiles -boolean true;killall Finder"

#exit
alias e42="gomac;rm -rf .Trash .duty .ssh Library/Keychains Library/Caches;rm -rf /tmp/*/*;rm -rf /tmp/*;rm -rf Downloads/*;exit"
