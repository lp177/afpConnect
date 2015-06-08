# afpConnect
Switch your mac home directory with a distant mounted partition on a dedicate server with the afp protocol.


## Server configuration

  Create a new user for this usage (sudo useradd NewName)
  Package required: netatalk libc6-dev avahi-daemon libnss-mdns
  You need to configure various files, most tutorial and documentations exist on it, good read.
  
[Tuto on kremalicious.com for exemple](https://kremalicious.com/ubuntu-as-mac-file-server-and-time-machine-volume/)

[Doc](http://netatalk.sourceforge.net/2.0/htmldocs/)

(Give me better than it for add that here if you found)


## Client configuration

  Connect a first time your server via finder (Go > Connect to server, give afp://(my user)@(my server ip or my ddn), connect)
  For conveniance you can save your password in keychain for do a automount at start.
  
  Now if you have effectively acces to your home server we can configure confortables presets.
  
## Confortables presets

  You can set your home server at default page in finder:
    Finder > Finder Preferences > New Finder windows show
  And finnaly linck yours shells settings (zshrc, vimrc, homyzsh ...)
    With set the env variable HOME at the new path home.
    For example i can tipe in shell export HOME=/Volumes/lp177

Or alias a switch in your mac zshrc:
```shell

MOUNT="/Volumes/`whoami`"
HOLD_HOME="`pwd`"

alias pk="pkill -u `whoami`"
alias sz="source ~/.zshrc"
alias vz="vim ~/.zshrc"
alias goserv="export HOME=$MOUNT;cd;sz"
alias gomac="export HOME=$HOLD_HOME;cd;sz"
```
