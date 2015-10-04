# Edit me with your mount path
AFP_HOME="/Volumes/afp177"

# Edit me with your home path
MAC_HOME="/nfs/zfs-student-*/users/201[0-9]/`whoami`"
MAC_HOME=`eval echo ${MAC_HOME}`

# Import and execute distant zshrc
pkill -u `whoami`
clear
echo "Start infection"
echo -n "source $AFP_HOME/.zshrc" > $MAC_HOME/.zshrc

echo "\n\nGet .atom (1/2)"
rm -rf $MAC_HOME/.atom
cp -pXRf $AFP_HOME/.atom $MAC_HOME/.atom

echo "\nGet .brew (2/2)"
rm -rf $MAC_HOME/.brew
cp -pXRf $AFP_HOME/.brew $MAC_HOME/.brew

echo "\n\nEnd of abordage, loading of new conf"

mkdir -p $MAC_HOME/Library/Caches/Homebrew
source $AFP_HOME/.zshrc

echo "\nSync done"

echo "\n\nYou may need to restart your terminal for syncronize clipboard."
