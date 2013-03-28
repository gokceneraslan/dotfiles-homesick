# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="pygmalion"
ZSH_THEME="norm"
#ZSH_THEME="wedisagree"
#ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found nyan fasd zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Enable completion on special dirs like ..
zstyle ':completion:*' special-dirs true

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

# fancy dircolors
if [ -f ~/.dir_colors ]; then
eval `dircolors ~/.dir_colors`
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias diff='colordiff'
alias wget='wget -c'

export EDITOR=vim
export TERM=screen-256color-bce

# Start tmux in every zsh shell
if [ "$TMUX" = "" ]; then tmux; fi

# only init fasd if installed.
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
	eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)" >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# for colorful man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

ZSH_HIGHLIGHT_STYLES+=(
  default 'none'
#  unknown-token 'fg=red,bold'
  reserved-word 'fg=yellow'
#  alias 'fg=none,bold'
#  builtin 'fg=none,bold'
#  function 'fg=none,bold'
#  command 'fg=none,bold'
  hashed-command 'fg=none,bold'
  path 'fg=cyan'
  globbing 'fg=cyan'
  history-expansion 'fg=blue'
  single-hyphen-option 'fg=magenta'
  double-hyphen-option 'fg=magenta'
  back-quoted-argument 'fg=magenta,bold'
  single-quoted-argument 'fg=green'
  double-quoted-argument 'fg=green'
  dollar-double-quoted-argument 'fg=cyan'
  back-double-quoted-argument 'fg=cyan'
  assign 'none'
)

export PATH=/usr/lib/ccache:$PATH

# correctall considered harmful
setopt nocorrectall
autoload zmv
