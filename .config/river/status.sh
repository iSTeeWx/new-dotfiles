#!/bin/env sh

cpu_last_work=1
cpu_last_total=1
cpu() {
  out=(`$HOME/.config/river/cpu-usage $cpu_last_total $cpu_last_work`)
  cpu_last_total=${out[0]}
  cpu_last_work=${out[1]}
  cpu=$(printf "%.0f%% " "${out[2]}")
}

wifi() {
  wifi=""
  if [[ $(cat /sys/class/rfkill/rfkill1/soft) = "1" ]]; then
    wifi="airplane "
  elif [[ $(cat /sys/class/net/wlp1s0/operstate) = "down" ]]; then
    wifi="no-network "
  fi
}

brightness() {
  brightness="$(brightnessctl | grep -Po "\d+%") "
  if [[ $brightness = "100% " ]]; then
    brightness=""
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
  color=''
  if [[ $bat_status = "Discharging" ]]; then
    icon='-'
  elif [[ $bat_status = "Charging" ]]; then
    color='^fg(#70FF93)'
    icon='+'
  fi

  if [[ $bat_capacity -lt 30 ]]; then
    color='^bg(#FF0000)^fg(#FFFFFF)'
  fi

  bat="$color$bat_capacity%$icon^fg()^bg() "

  if [[ $bat_capacity = '100' ]]; then
    bat=""
  fi
}

datetime() {
	datetime="$(date "+%R")"
}

display() {
	echo "all status $wifi$brightness$vol$cpu$bat$datetime" >"$FIFO"
}

printf "%s" "$$" > "$XDG_RUNTIME_DIR/status_pid"
FIFO="$XDG_RUNTIME_DIR/sandbar"
[ -e "$FIFO" ] || mkfifo "$FIFO"
sec=0

while true; do
	sleep 1 &
	wait && {
		[ $((sec % 1)) -eq 0 ] && wifi 
		[ $((sec % 1)) -eq 0 ] && brightness
		[ $((sec % 1)) -eq 0 ] && cpu
		[ $((sec % 2)) -eq 0 ] && bat
		[ $((sec % 1)) -eq 0 ] && vol
		[ $((sec % 10)) -eq 0 ] && datetime

		display

		sec=$((sec + 1))
	}
done
