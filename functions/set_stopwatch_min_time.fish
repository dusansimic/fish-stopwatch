function set_stopwatch_min_time
    argparse --name=set_stopwatch_min_time --min-args=1 --max-args=1 -- $argv
    or return

    if string match -qr '^\d+$' -- $argv[1]
        set -x fish_stopwatch_min_duration $argv[1]
    end
end
