if not set -q fish_stopwatch_enabled
    set fish_stopwatch_enabled 1
end

if not set -q fish_stopwatch_min_duration
    set fish_stopwatch_min_duration 10000 # 10s
end

function format_stopwatch_time
    set -l sw_sec  1000
    set -l sw_min  60000
    set -l sw_hour 3600000
    set -l sw_day  86400000

    set -l sw_n_days  (math --scale=0 "$CMD_DURATION / $sw_day")
    set -l sw_n_hours (math --scale=0 "$CMD_DURATION % $sw_day / $sw_hour")
    set -l sw_n_mins  (math --scale=0 "$CMD_DURATION % $sw_hour / $sw_min")
    set -l sw_n_secs  (math --scale=0 "$CMD_DURATION % $sw_min / $sw_sec")
    set -l sw_n_millis (math --scale=0 "$CMD_DURATION % $sw_sec")

    set -l sw_stopwatch_str ""

    if [ $sw_n_days -gt 0 ]
        set sw_stopwatch_str {$sw_stopwatch_str}{$sw_n_days}"d"
    end
    if [ $sw_n_hours -gt 0 ]
        set sw_stopwatch_str {$sw_stopwatch_str}{$sw_n_hours}"h"
    end
    if [ $sw_n_mins -gt 0 ]
        set sw_stopwatch_str {$sw_stopwatch_str}{$sw_n_mins}"m"
    end
    if [ $sw_n_secs -gt 0 ]
        set sw_stopwatch_str {$sw_stopwatch_str}{$sw_n_secs}"s"
    end
    if [ $sw_n_millis -gt 0 ]
        set sw_stopwatch_str {$sw_stopwatch_str}{$sw_n_millis}
    end

    echo $sw_stopwatch_str
end

function fish_stopwatch_postexec --on-event fish_postexec
    if test $fish_stopwatch_enabled -eq 0
       return
    end

    if test $CMD_DURATION -lt $fish_stopwatch_min_duration
       return
    end

    if test $argv[1] = "clear"
        return
    end

    set -l sw_stopwatch_str_colored (set_color brblue)(format_stopwatch_time)(set_color normal)
    echo ""
    echo "  $sw_stopwatch_str_colored"
end
