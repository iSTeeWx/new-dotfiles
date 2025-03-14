alias l='ls -A1 --group-directories-first --color=auto '
alias poff='systemctl poweroff'
alias susp='systemctl suspend'

alias 1440='xrandr --output eDP1 --mode 2560x1440'
alias nmtui='NEWT_MONO=1 nmtui'
alias n='nvim '
alias code="gtk-launch codium-wayland "

alias gs="git status"
alias ga="git add "
alias gcm="git commit -m "
alias gp="git push "
alias gd="git diff"

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
