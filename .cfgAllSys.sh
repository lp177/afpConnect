# Colors man
export LESS_TERMCAP_mb=$'\E[01;31m'    # début de blink
export LESS_TERMCAP_md=$'\E[01;31m'    # début de gras
export LESS_TERMCAP_me=$'\E[0m'        # fin
export LESS_TERMCAP_so=$'\E[01;44;33m' # début de la ligne d`état
export LESS_TERMCAP_se=$'\E[0m'        # fin
export LESS_TERMCAP_us=$'\E[01;32m'    # début de souligné
export LESS_TERMCAP_ue=$'\E[0m'        # fin

# Change viewer of man
export PAGER=less
export LESS="-FSRX"

# Colors grep
export GREP_OPTIONS="--color=auto"

# Add path to potential cd anywhere
CDPATH="$HOME/:$HOME/Sync/:$HOME/Sync/C/:$HOME/Sync/C/sh/:$HOME/Sync/love"

# Du
alias showBig="du -ch | grep 'M	'"
alias showRealyBig="du -ch | grep 'G	'"

# Zshrc
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias cz="cat ~/.zshrc"
alias va="vim ~/.zshrc-core.sh"

# View
alias tree="tree -Cah"
alias la="ls -lah"
alias l="ls -la"

# Compile
alias c+="clang++ *cpp"
alias CC="/usr/bin/gcc"

# Git
alias gs="git status"
alias gp="git push origin master"
alias gc="git commit -am"
alias gl="git log --graph --decorate --abbrev-commit --cherry  --pretty=oneline master origin/master master"
alias gll="git log --graph --decorate --abbrev-commit --cherry --relative-date master origin/master master"

alias pk="pkill -u `whoami`"

alias dieDuty=\
"
	rm -f ~/**/.*.(swp|swo|gch);
	rm -f ~/**/**.o;
	rm -rf ~/**/.DS_Store
"
alias die=\
"
	rm -f .*.(swp|swo|gch);
	rm -f *.o;
	rm -rf .DS_Store;
	rm a.out
"

# Install ohmyzsh, vundle, pathogen and nerdtree
alias autoInstall="
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	rm -rf .zsh-update .zshrc.pre-oh-my-zsh .zshrc-e .zcompdump*

	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	mkdir -p ~/.vim/autoload ~/.vim/bundle && 	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	cd ~/.vim/bundle
	git clone https://github.com/scrooloose/nerdtree.git
"

source $HOME/.gitSync/gitSync.sh

export ZSH=~/.oh-my-zsh
export UPDATE_ZSH_DAYS=1
plugins=(git)
source $ZSH/oh-my-zsh.sh
