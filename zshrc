
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit load agkozak/zsh-z

### End of Zinit's installer chunk
#
source "$HOME/.nix-profile/etc/profile.d/nix.sh"

alias ls="ls -G"
alias h="home-manager"
alias gst="nvim -c 'G | wincmd j | hide'"
alias lzg="lazygit"
alias nixu="nix-channel --update; nix-env -iA nixpkgs.nix"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey "ç" fzf-cd-widget

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=nvim
export PATH=$PATH:~/.local/bin:~/.cargo/bin
export NIXPKGS_ALLOW_UNFREE=1
export NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1
export LIBRARY_PATH=$LIBRARY_PATH:~/.nix-profile/lib # add nix libraries to the path for clang
export LDFLAGS='-L/usr/local/lib -L/usr/local/opt/openssl/lib -L/usr/local/opt/readline/lib'
export CPPFLAGS='-I/usr/local/opt/openssl/include'
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS="--extended --cycle -e"

eval "$(starship init zsh)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
