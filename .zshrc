# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/dezire/.zsh/completions:"* ]]; then export FPATH="/home/dezire/.zsh/completions:$FPATH"; fi
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
setopt COMPLETE_ALIASES
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dezire/.zshrc'
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' menu select



alias gt='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias ls='ls --color'
alias la='ls -la --color'
alias grep='grep --color=auto'
alias dc='docker-compose'
alias vim='nvim_dir_setter'
alias esp-export='. $HOME/esp/esp-idf/export.sh'
alias esp8266-export='export PATH="$PATH:$HOME/esp/xtensa-lx106-elf/bin" && export IDF_PATH="~/esp/ESP8266_RTOS_SDK"'

export VISUAL=vim
export EDITOR=vim


# Open specified folder as root for nvim
nvim_dir_setter(){
    if [ -d ${@:$#} ]; then
        cd ${@:$#}  && nvim .
    else
        nvim $@
    fi
}


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
