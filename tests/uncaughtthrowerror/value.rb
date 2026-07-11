# frozen_string_literal: true
# UncaughtThrowError#value
# An uncaught throw carrying a value raises a rescuable UncaughtThrowError whose #value is that value.
e001 = (throw :nope, 42 rescue $!); p e001.value
v002 = (throw :nope, 42 rescue $!).value; p v002

# a throw with no value -> #value is nil
e003 = (throw :bare rescue $!); p e003.value
v004 = (throw :bare rescue $!).value; p v004

# a non-integer value round-trips
e005 = (throw :s, "payload" rescue $!); p e005.value

# catch-wrapped: the value is carried out into the rescued exception
r006 = (begin; catch(:a) { throw :b, [1, 2] }; rescue UncaughtThrowError => e006; e006.value; end); p r006

# a matched catch returns the thrown value directly (no exception)
p(catch(:c) { throw :c, 99 })
h007 = catch(:c) { throw :c, 99 }; p h007
