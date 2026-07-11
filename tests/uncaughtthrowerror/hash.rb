# frozen_string_literal: true
# UncaughtThrowError#hash (Object#hash)
# hash is an Integer
e001 = (throw :x, 5 rescue $!); p(e001.hash.is_a?(Integer))
h002 = (throw :x, 5 rescue $!).hash; p h002.is_a?(Integer)

# hash is stable for the same object
e003 = (throw :x, 5 rescue $!); p(e003.hash == e003.hash)
r004 = (e003.hash == e003.hash); p r004
