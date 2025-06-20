### log_cpu_usage.sh
#### m h  dom mon dow   command
### * * * * * /home/hermanto/cpu-log/log_cpu_usage.sh ##crontab -e ##

#!/bin/bash

# Direktori untuk log
LOG_DIR="/var/log/cpu-usage"
mkdir -p "$LOG_DIR"

# Nama file log berdasarkan tanggal
LOG_FILE="$LOG_DIR/cpu-usage-$(date '+%Y-%m-%d').log"

# Tulis waktu dan proses tertinggi
{
    echo "=== $(date '+%Y-%m-%d %H:%M:%S') ==="
    ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 11
    echo "-----------------------------"
} >> "$LOG_FILE"

# Proteksi log agar tidak bisa dimodifikasi
chattr +a "$LOG_FILE"
