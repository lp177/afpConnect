AFP_HOME="/Volumes/afp177"

MAC_HOME="/Volumes/Data/nfs/zfs-student-*/users/20[0-9][0-9]/`whoami`"
MAC_HOME=`eval echo ${MAC_HOME}`

export MAC_HOME
export AFP_HOME

PATH_BASE="$AFP_HOME/app:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

alias goserv="
	export HOME=$AFP_HOME;
	cd
"
goserv
alias gomac="
	export HOME=$MAC_HOME;
	cd
"

alias extractBrew="
	rm -rf $AFP_HOME/._brew
	mv $AFP_HOME/.brew $AFP_HOME/._brew
	cp -pXRf $MAC_HOME/.brew $AFP_HOME/.brew
"
alias extractAtom="
	rm -rf $AFP_HOME/._atom
	mv $AFP_HOME/.atom $AFP_HOME/._atom
	cp -pXRf $MAC_HOME/.atom $AFP_HOME/.atom
"
alias extractAll="
	extractAtom
	extractBrew
"

alias infect="cat AFP_HOME/.start > $MAC_HOME/.zshrc"
