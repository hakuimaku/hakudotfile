#!/bin/bash

PID_FILE="/tmp/recording_pid"
TIME_FILE="/tmp/recording_time"
SAVE_DIR="$HOME/Videos" 
mkdir -p "$SAVE_DIR"

# wl-screenrec mặc định tối ưu encode phần cứng nên chỉ cần set max-fps.
# Nếu quay game thấy bị mờ, bro có thể thêm `--video-bitrate 10MB` vào chuỗi này.
REC_OPTS="--max-fps 60"

stop_recording() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        
        # wl-screenrec cũng lắng nghe tín hiệu SIGINT để chốt file MP4 an toàn
        kill -SIGINT "$PID"
        
        # Đợi quá trình lưu hoàn tất
        while ps -p $PID > /dev/null; do sleep 0.1; done
        
        rm -f "$PID_FILE"
        rm -f "$TIME_FILE"
        notify-send -u normal "Recording System" "Saved Video" -i video-display
    fi
}

start_recording() {
    options="󰑊 Only Sound\n󰍬 Micro and Sound\n󰔊 No Sound"
    
    chosen=$(echo -e "$options" | rofi -dmenu -i -p "Select Mode:" \
    -theme-str "window { width: 35%; }")

    if [ -z "$chosen" ]; then
        exit 0
    fi

    FILENAME="recording_$(date +%Y%m%d_%H%M%S).mp4"
    FILEPATH="$SAVE_DIR/$FILENAME"
    
    case "$chosen" in
        *"Only Sound")
            # Cờ --audio bật ghi âm thanh, --audio-device chỉ định nguồn
            wl-screenrec $REC_OPTS --audio --audio-device default.monitor -f "$FILEPATH" &
            MSG="Đang quay: System Audio"
            ;;
        *"Micro and Sound")
            # Thu âm thanh từ thiết bị mặc định (thường là Mic). 
            # Nếu muốn mix cả game + mic thì bro cần setup loopback trên Pipewire.
            wl-screenrec $REC_OPTS --audio -f "$FILEPATH" &
            MSG="Đang quay: Mic/Default"
            ;;
        *"No Sound")
            # Chỉ quay hình
            wl-screenrec $REC_OPTS -f "$FILEPATH" &
            MSG="Đang quay: Không tiếng"
            ;;
    esac

    echo $! > "$PID_FILE"
    notify-send -u critical "Recording System" "$MSG" -i video-display -t 3000
    
    # Bộ đếm giờ
    SEC=0
    while [ -f "$PID_FILE" ] && ps -p $(cat "$PID_FILE") > /dev/null; do
        MIN=$((SEC / 60))
        S=$((SEC % 60))
        printf "%02d:%02d" $MIN $S > "$TIME_FILE"
        sleep 1
        SEC=$((SEC + 1))
    done
    
    rm -f "$PID_FILE" "$TIME_FILE"
}

if [ -f "$PID_FILE" ]; then
    stop_recording
else
    start_recording
fi