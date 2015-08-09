MOUNT="/Volumes/myMountName"
HOLD_HOME="/nfs/zfs-student-*/users/20[0-9][0-9]/`whoami`"
HOLD_HOME=`eval echo ${HOLD_HOME}`

pkill -u `whoami`

echo -n "source $MOUNT/.z42.sh" > $HOLD_HOME/.zshrc

source $MOUNT/.z42.sh

rm -rf $HOLD_HOME/.brew
cp -pXRf $MOUNT/.brew $HOLD_HOME/.brew
