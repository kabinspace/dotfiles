#!/bin/sh

rofi_command="rofi -theme ~/.config/rofi/themes/brightness.rasi "

# Get Brightness
if [[ -f /bin/brightnessctl ]]; then
  BNESS="$(brightnessctl get)"
  MAX="$(brightnessctl max)"
  PERC="$((BNESS * 100 / MAX))"
  BLIGHT=${PERC%.*}
elif [[ -f /usr/bin/blight ]]; then
  DEVICE=$(ls /sys/class/backlight | head -n 1)
  BNESS="$(blight -d $DEVICE get brightness)"
  PERC="$(($BNESS * 100 / 255))"
  BLIGHT=${PERC%.*}
elif [[ -f /usr/bin/xbacklight ]]; then
  VAR="$(xbacklight -get)"
  BLIGHT="$(printf "%.0f\n" "$VAR")"
else
  msg "No suitable backlight utility found!"
  exit 1
fi

if [[ $BLIGHT -ge 1 ]] && [[ $BLIGHT -le 29 ]]; then
  MSG="Low"
elif [[ $BLIGHT -ge 30 ]] && [[ $BLIGHT -le 49 ]]; then
  MSG="Optimal"
elif [[ $BLIGHT -ge 50 ]] && [[ $BLIGHT -le 69 ]]; then
  MSG="High"
elif [[ $BLIGHT -ge 70 ]] && [[ $BLIGHT -le 99 ]]; then
  MSG="Too Much"
fi

# Icons
low="  Low"
optimal="  Optimal"
high="  High"

notify="notify-send -u low -t 1500"
options="$low\n$optimal\n$high"

# Main
chosen="$(echo -e "$options" | $rofi_command -p "  Brightness" -dmenu -selected-row 0)"
case $chosen in
"$low")
  if [[ -f /bin/brightnessctl ]]; then
    brightnessctl s 50% && $notify "Brightness set to Low"
  fi
  ;;
"$optimal")
  if [[ -f /bin/brightnessctl ]]; then
    brightnessctl s 75% && $notify "Brightness set to Optimal"
  fi
  ;;
"$high")
  if [[ -f /bin/brightnessctl ]]; then
    brightnessctl s 100% && $notify "Brightness set to High"
  fi
  ;;
esac
