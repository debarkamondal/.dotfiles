# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dezire/.zshrc'

autoload -Uz compinit
compinit
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

neofetch
eval "$(starship init zsh)"

alias gt='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias ls='ls --color'
alias la='ls -la --color'
alias grep='grep --color=auto'

zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1
#export PATH=$HOME/.config/rofi/bin:$PATH
