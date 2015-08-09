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
mkdir -p $HOLD_HOME/Library/Caches/Homebrew
