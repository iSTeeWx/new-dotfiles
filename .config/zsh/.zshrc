setopt autocd
bindkey -e

HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

eval $(dircolors ~/.config/zsh/dir_colors)

zstyle :compinstall filename '/home/vlad/.config/zsh/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

source ~/.config/zsh/aliases.sh
source ~/.config/zsh/keymap.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

if zmodload zsh/terminfo && (( terminfo[colors] >= 256 )); then
  source ~/.config/zsh/.p10k.fancy.zsh
else
  source ~/.config/zsh/.p10k.tty.zsh
fi

