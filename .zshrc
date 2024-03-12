export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="materialshell"

# Which plugins would you like to load
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting kubectx kubectl kube-ps1 colorize zsh-interactive-cd fzf)

fpath=($ZSH/custom/completions $fpath)
#autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias k="kubectl"
alias kubectx="kubectl ctx"
alias kubens="kubectl ns"


export KUBECONFIG=~/.kube/config
export EDITOR=vim

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/home/puriin/.local/bin:$PATH"


PROMPT='$(kube_ps1)'$PROMPT # or RPROMPT='$(kube_ps1)'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"
