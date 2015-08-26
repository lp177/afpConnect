AFP_HOME="/Volumes/afp177"

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
