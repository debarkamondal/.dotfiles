source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh


alias vim="nvim"
alias ls="ls --color"
# alias esp=". $HOME/esp/esp-idf/export.sh"
# alias set-matter=". $HOME/esp/esp-matter/export.sh"

export PATH="/opt/homebrew/opt/python@3.13/libexec/bin:/opt/homebrew/opt/ccache/libexec:$PATH"
export PATH="/Users/destiny/.rustup/toolchains/stable-aarch64-apple-darwin/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/Users/destiny/.cargo/bin:$PATH"
export PATH="/Users/destiny/.nvm/versions/node/v25.5.0/bin:$PATH"

# export IDF_CCACHE_ENABLE=1
export XDG_CONFIG_DIR="$HOME/.config"

#Bitwarden ssh agent
export SSH_AUTH_SOCK=/Users/destiny/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock

#Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK_HOME=$HOME/Library/Android/sdk/ndk/30.0.14904198/
export ANDROID_HOME=$HOME/Library/Android/sdk && export PATH=$PATH:$ANDROID_HOME/emulator && export PATH=$PATH:$ANDROID_HOME/platform-tools

#JVM
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

#NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#Enable fuzzy finding
if [[ -x $(command -v fzf) ]]; then
  eval "$(fzf --zsh)"
fi


# bun completions
[ -s "/Users/destiny/.bun/_bun" ] && source "/Users/destiny/.bun/_bun"


# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/destiny/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

alias ns="sudo pmset -a disablesleep 1"
alias ys="sudo pmset -a disablesleep 0"
eval "$(starship init zsh)"

# Added by Antigravity IDE
export PATH="/Users/destiny/.antigravity-ide/antigravity-ide/bin:$PATH"


