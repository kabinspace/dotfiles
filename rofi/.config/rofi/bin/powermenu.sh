#!/bin/sh
rofi_command="rofi -i -theme ~/.config/rofi/themes/powermenu.rasi"

chosen=$(printf "  Power Off\n  Restart\n  Logout\n  Sleep\n  Lock" | rofi -dmenu -p " Power Menu" -theme ~/.config/rofi/themes/powermenu.rasi)

case "$chosen" in
"  Power Off") poweroff ;;
"  Restart") reboot ;;
"  Lock") betterlockscreen -l dimblur ;;
"  Logout") bspc quit ;;
"  Sleep") systemctl suspend ;;
*) exit 1 ;;
esac
