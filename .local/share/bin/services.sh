declare -A services

services[wifi]="wpa_supplicant@wlp1s0"
services[bluetooth]="bluetooth"
services[libvirt]="libvirtd"
# services[mariadb]="mariadb"
# services[apache]="httpd"
services[docker]="docker"
services[ssh]="sshd"

text=""
for key in "${!services[@]}"; do
  state=$(systemctl status ${services[$key]} | grep -Po "(active|inactive)")
  if [[ $state = "active" ]]; then
    state="on"
  else
    state="off"
  fi
  text+="$key: $state\n"
done

result=$(echo -e $text | tofi)

if [[ -z $result ]]; then
  exit
fi

state=$(echo $result | grep -Po "(on|off)")
result=${result%:*}

if [[ $state = "on" ]]; then
  state="stop"
else
  state="start"
fi

echo $result
echo $state

kitty sh -c "
echo sudo systemctl $state ${services[$result]};
sudo systemctl $state ${services[$result]};
echo systemctl status ${services[$result]};
systemctl status ${services[$result]};
"
