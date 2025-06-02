export ZDOTDIR=$HOME/.config/zsh
export GTK_THEME=Adwaita:dark
export _JAVA_AWT_WM_NONREPARENTING=1
export PYTHON_HISTORY=$HOME/.local/share/python/history
export MYSQL_HISTFILE=$HOME/.local/share/mariadb/history

export PATH=/opt/processing-4.3.4/:$PATH

export EDITOR=nvim
export MANPAGER='nvim +Man!'

if [ -z "$WAYLAND_DISPLAY" ] && [ $(tty) = "/dev/tty1" ]; then
  exec river > ~/.cache/river.log 2>&1
fi
