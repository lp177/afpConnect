#On the local session
MOUNT="/Volumes/`whoami`"
HOLD_HOME="/nfs/zfs-student-3/users/2014/luperez"

alias la="ls -lah"
alias pk="pkill -u `whoami`" #kill the helper and others dutys after startup
alias sz="source ~/.zshrc"
alias vz="vim ~/.zshrc"

alias mvAppSup="
	rm -rf $HOLD_HOME/Library/Application\ Support;
	cp -R $MOUNT/Application\ Support Library/Application\ Support
"
alias mvKeyChain="
	rm -rf $HOLD_HOME/Library/Keychains;
	cp -R $MOUNT/Keychains $HOLD_HOME/Library/Keychains
"
#do a save to local Keychain & Application support on the server
alias upServConf="
	rm -rf $MOUNT/Application\ Support;
	rm -rf $MOUNT/Keychains;

	cp -R $HOLD_HOME/Library/Keychains $MOUNT/Keychains
	cp -R $OLD_HOME/Library/Application\ Support $MOUNT/Application\ Support
"
alias sz="source ~/.zshrc"
alias vz="vim ~/.zshrc"
alias cz="cat ~/.zshrc"

alias dieDuty="rm -f ~/**/.*.(swp|swo); rm -f ~/**/**.o;rm -rf ~/**/.DS_Store"
alias emptyTrash="rm -rf ~/.Trash/*"

alias gomac="export HOME=$HOLD_HOME;cd;sz"
alias gs="export HOME=$MOUNT;cd;sz" #just got to server and rebase $HOME
alias gs7="mvAppSup;mvKeyChain;gs"  #do a gs same side top and cp conf (Keychain & Application support) to server from local session
