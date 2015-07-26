MOUNT="/Volumes/myMountName"
HOLD_HOME="/nfs/zfs-student-*/users/201*/`whoami`"
HOLD_HOME=`eval echo ${TRY_PATH}`

pkill -u `whoami`
echo -n "source $MOUNT/.z42.sh" > $HOLD_HOME/.zshrc
source $MOUNT/.z42.sh
cp -R $MOUNT/.brew $HOLD_HOME/.brew
