ZSH_THEME="candy"

source /Volumes/afp177/.afpConnect.sh

# Brew
export PATH=$MAC_HOME/.brew/bin:$PATH_BASE
export HOMEBREW_TEMP=/tmp
export HOMEBREW_PREFIX=$MAC_HOME/.brew;
export HOMEBREW_CELLAR=$MAC_HOME/.brew/Cellar;


# Alias
alias sysinfo="system_profiler SPSoftwareDataType"

alias emptyLib="
	rm -rf \"$MAC_HOME/Library/Caches\"
	rm -rf \"$MAC_HOME/Library/Keychains\"
	rm -rf \"$MAC_HOME/Library/Application Support/Sublime Text 3/Cache\"
	rm -rf \"$MAC_HOME/.atom/compile-cache\"
"

alias emptyTrash="rm -rf \"$MAC_HOME/.Trash/*\""

# Clean up your session previous exit 42
alias e42="
	gomac
	rm -rf \"$MAC_HOME/.zcompdump-*\"
	rm -rf /tmp/*/*
	rm -rf /tmp/*
	rm -rf \"$MAC_HOME/Downloads/*\"
	emptyTrash
	emptyLib
	exit
"
# See invisible items in finder
alias showMeTruth="defaults write com.apple.finder AppleShowAllFiles -boolean true;killall Finder"

alias norme=\
"
	grep \" strdup\" *.[ch];
	grep printf *.[ch];
	grep // **/*.[ch];
	norminette **/*.[ch] | grep Error
"
alias normeAll=\
"
	grep \" strdup\" *.[ch];
	grep printf *.[ch];
	grep // **/*.[ch];
	norminette **/*.[ch]
"
# Manipule libft
alias p7=\
"
	rm -rf libft;
	mkdir libft libft/includes;
	cp $HOME/Sync/C/Libft/*.c libft/.;
	cp $HOME/Sync/C/Libft/includes/*.h libft/includes/.;
	cp $HOME/Sync/C/Libft/Makefile libft/.;
	rm -f libft/main.c
"
alias u7=\
"
	cd libft;
	rm -rf\
		$HOME/Sync/C/Libft/*.c\
		$HOME/Sync/C/Libft/Makefile\
		$HOME/Sync/C/Libft/includes/libft.h\
	cp *.c $HOME/Sync/C/Libft/.;
	cp includes/libft.h $HOME/Sync/C/Libft/includes/.;
	cp includes/st_libft.h $HOME/Sync/C/Libft/includes/.;
	cp Makefile $HOME/Sync/C/Libft/.;cd -
"
alias c7="rm -rf libft;rm -rf libft.a"
