#!/bin/sh

rofi_command="rofi -i"

# Browser
if [[ -f /usr/bin/firefox ]]; then
  app="firefox"
elif [[ -f /usr/bin/chromium ]]; then
  app="chromium"
elif [[ -f /usr/bin/midori ]]; then
  app="midori"
else
  msg "No suitable web browser found!"
  exit 1
fi

# Links
google="  Google"
github="  Github"
mail="  Email"
youtube="  Youtube"

# Variable passed to rofi
options="$google\n$github\n$mail\n$youtube"

chosen="$(echo -e "$options" | $rofi_command -p -dmenu -selected-row 0)"
case $chosen in
$google)
  $app https://www.google.com &
  ;;
$github)
  $app https://www.github.com &
  ;;
$mail)
  $app https://www.gmail.com &
  ;;
$youtube)
  $app https://www.youtube.com &
  ;;
esac
