# $1 can have the following values:
# increase: increase volume
# decrease: decrease volume
# mute: toggle the mute
# mic: toggle the mic

function send_sound_level_notification() {
    sound_level=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
    dunstify -a sound_level -u low -r 9991 -h int:value:$sound_level -i "$HOME/.config/i3/scripts/assets/sound.png" "Sound: $sound_level%"
}

function send_mic_toggle_notification() {
    mic_status=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q 'MUTED' && echo "off" || echo "on")
    
    if [ "$mic_status" = "on" ]; then
        text="Your microphone is now unmuted."
    else
        text="Your microphone is now muted."
    fi

    dunstify -a toggle_mic -u low -r 9991 -i "$HOME/.config/i3/scripts/assets/microphone_$mic_status.png" "$text"
}

function send_sound_toggle_notification() {
    sound_status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q 'MUTED' && echo "off" || echo "on")
    
    if [ "$sound_status" = "on" ]; then
        text="Your sound is now unmuted."
    else
        text="Your sound is now muted."
    fi

    dunstify -a toggle_sound -u low -r 9991 -i "$HOME/.config/i3/scripts/assets/sound_$sound_status.png" "$text"
}

arg=$1

if [ "$arg" = "increase" ]; then
    wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
    send_sound_level_notification
elif [ "$arg" = "decrease" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    send_sound_level_notification
elif [ "$arg" = "mute" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    send_sound_toggle_notification
elif [ "$arg" = "mic" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    send_mic_toggle_notification
fi
