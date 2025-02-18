# This file will be responsible for changing the brightness using
# brillo, and will also send notifications accordingly.
# arg can be ("increase", "decrease")

function send_notification() {
    brightness=$(printf "%.0f\n" $(brillo -G))
    dunstify -a brightness -u low -r 9991 -h int:value:$brightness -i "$HOME/.config/i3/scripts/assets/brightness.png" "Brightness: $brightness%"
}

arg=$1

if [ "$arg" = "increase" ]; then
    brillo -A 5 -q
elif [ "$arg" = "decrease" ]; then
    brillo -U 5 -q
fi

send_notification
