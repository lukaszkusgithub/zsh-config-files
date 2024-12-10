# Timer start
# zmodload zsh/zprof

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

typeset -A ZSH_HIGHLIGHT_STYLES

# Commands and built-ins
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'

# Arguments
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow,bold'

# File paths
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan,underline'

# Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=red'

# Disable globbing
ZSH_HIGHLIGHT_STYLES[globbing]='none'


# Preferred editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# PATH adjustments
export PATH="/opt/homebrew/bin:/opt/homebrew/opt/openssl@1.1/bin:$HOME/.cargo/bin:$HOME/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"

# Lazy-load Conda
_conda_lazy_init() {
  unset -f conda
  source "$HOME/anaconda3/etc/profile.d/conda.sh"
}
alias conda="_conda_lazy_init; conda"

# Docker
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Lazy-load FNM
_fnm_lazy() {
  eval "$(fnm env --use-on-cd --log-level=quiet)"
}
autoload -Uz add-zsh-hook
add-zsh-hook chpwd _fnm_lazy
_fnm_lazy

# Powerlevel10k
# if [[ -t 1 ]]; then
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Angular CLI autocompletion (lazy-load)
_lazy_load_ng_completion() {
  source <(ng completion script)
}
alias ng="_lazy_load_ng_completion && ng"


############### ALIASES ###############

# >>> global aliases initialize >>>
alias -g work="cd ~/work"
alias -g lsh='ls -a | grep "^\."'
alias -g src='source .zshrc'
# <<< global aliases initialize <<<


# >>> git aliases initialize >>>
alias -g gs="git status"
alias -g ga="git add ."
alias -g gc="git commit"
# >>> git aliases initialize >>>

# Timer end
# zprof
