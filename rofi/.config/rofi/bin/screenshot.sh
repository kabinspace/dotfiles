#!/bin/sh

rofi_command="rofi -i -theme ~/.config/rofi/themes/screenshot.rasi"

# Options
screen="  Screen"
window="  Window"
area="  Area"

# Variable passed to rofi
options="$screen\n$window\n$area"

chosen="$(echo -e "$options" | $rofi_command -p '  Screenshot' -dmenu -selected-row 0)"
case $chosen in
$screen)
  if [[ -f /usr/bin/scrot ]]; then
    sleep 1
    scrot -e 'mv $f ~/Pictures/screenshots'
    notify-send --app-name="screenshot" "Screenshot" "Saved successfully"
  else
    msg
  fi
  ;;
$area)
  if [[ -f /usr/bin/scrot ]]; then
    scrot -s -e 'mv $f ~/Pictures/screenshots'
    notify-send --app-name="screenshot" "Screenshot" "Saved successfully"
  else
    msg
  fi
  ;;
$window)
  if [[ -f /usr/bin/scrot ]]; then
    notify-send --app-name="screenshot" "Screenshot" "Saved successfully"
    sleep 1
    scrot -u -e 'mv $f ~/Pictures/screenshots'
  else
    msg
  fi
  ;;
esac
