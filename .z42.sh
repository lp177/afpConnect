MOUNT="/Volumes/myMountName"
HOLD_HOME="/nfs/zfs-student-*/users/201*/`whoami`"
HOLD_HOME=`eval echo ${TRY_PATH}`

export HOME=$MOUNT
alias goserv="export HOME=$MOUNT;cd"
alias gomac="export HOME=$HOLD_HOME;cd"

#Unactive .DS_Store on shared DD
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

alias showMeTruth="defaults write com.apple.finder AppleShowAllFiles -boolean true;killall Finder"

alias e42="gomac;rm -rf .Trash .duty .ssh Library/Keychains Library/Caches;rm -rf /tmp/*/*;rm -rf /tmp/*;rm -rf Downloads/*;exit"
