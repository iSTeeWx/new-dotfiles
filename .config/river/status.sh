#!/bin/env sh

cpu() {
	cpu="$(grep -o "^[^ ]*" /proc/loadavg)"
}

wifi() {
  state=$(nmcli | grep -Po '(?<=^wlp1s0?: )\w')

  wifi=""

  if [[ $state = "u" ]]; then
    wifi="airplane "
  elif [[ $state = "d" ]]; then
    wifi="disconnected "
  fi
}

vol() {
  mute=$(pactl get-sink-mute @DEFAULT_SINK@)
  if [[ $mute = "Mute: no" ]]; then
    text="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+%' | head -n1) "
  else
    text=""
  fi

  vol=$text
}

bat() {
	read -r bat_status </sys/class/power_supply/BAT0/status
	read -r bat_capacity </sys/class/power_supply/BAT0/capacity

  icon=''
  if [[ $bat_status = "Discharging" ]]; then
    icon='-'
  elif [[ $bat_status = "Charging" ]]; then
    icon='+'
  fi

	bat="$bat_capacity%$icon "

  if [[ $bat_capacity = '100' ]]; then
    bat=""
  fi
}

datetime() {
	datetime="$(date "+%R")"
}

display() {
	echo "all status $wifi$vol$bat$datetime" >"$FIFO"
}

printf "%s" "$$" > "$XDG_RUNTIME_DIR/status_pid"
FIFO="$XDG_RUNTIME_DIR/sandbar"
[ -e "$FIFO" ] || mkfifo "$FIFO"
sec=0

while true; do
	sleep 1 &
	wait && {
		[ $((sec % 1)) -eq 0 ] && wifi 
		[ $((sec % 15)) -eq 0 ] && cpu
		[ $((sec % 2)) -eq 0 ] && bat
		[ $((sec % 1)) -eq 0 ] && vol
		[ $((sec % 10)) -eq 0 ] && datetime

		display

		sec=$((sec + 1))
	}
done
