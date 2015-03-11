MOUNT="/Volumes/`whoami`"
HOLD_HOME="/nfs/zfs-student-2/users/2014/luperez"

alias pk="pkill -u `whoami`"
alias sz="source ~/.zshrc"
alias vz="vim ~/.zshrc"
alias goserv="export HOME=$MOUNT;cd;sz"
alias gomac="export HOME=$HOLD_HOME;cd;sz"
