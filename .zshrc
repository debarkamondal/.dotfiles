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
alias vim='nvim'
alias esp-export='. $HOME/esp/esp-idf/export.sh'
alias esp8266-export='export PATH="$PATH:$HOME/esp/xtensa-lx106-elf/bin" && export IDF_PATH="~/esp/ESP8266_RTOS_SDK"'

#Android Studio
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_AVD_HOME=$HOME/.config/.android/avd
export ANDROID_NDK_HOME=$HOME/Android/Sdk/ndk/27.1.12297006/
export ANDROID_HOME=$HOME/Android/Sdk && export PATH=$PATH:$ANDROID_HOME/emulator && export PATH=$PATH:$ANDROID_HOME/platform-tools


export VISUAL=nvim
export EDITOR=nvim
export SSH_AUTH_SOCK=/home/dezire/.bitwarden-ssh-agent.sock


export PATH="/home/dezire/.cache/.bun/bin:$PATH"
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(fzf --zsh)
source /usr/share/nvm/init-nvm.sh

eval "$(starship init zsh)"
