# Stopwatch for fish shell

A simple and opinionated command stopwatch (timer).

After a command is executed, if the execution duration is longer than a defined
minimum (10s by default), it prints out the execution duration neatly formated.

```
$ python program.py
Some program output

  5d 1h 36m 23s 41
$
```

The output displayed above shows a program that was running for 5 days, 1 hour,
36 minutes, 23 seconds and 41 milliseconds.

The stopwatch output can be disabled temoprarily using a fish function
`disable_stopwatch` and enabled again using `enable_stopwatch`.

You can also change the minimum execution time with the `set_stopwatch_min_time`
by passing the desired time in milliseconds.

## Inspiration

[fish-command-timer](https://github.com/jichu4n/fish-command-timer)

## License

[MIT](./LICENSE)
