# frozen_string_literal: true
# SignalException#hash (Object#hash)
# hash is an Integer
p(SignalException.new("INT").hash.is_a?(Integer))
h001 = SignalException.new("INT").hash; p h001.is_a?(Integer)

# hash is stable for the same object
f002 = SignalException.new("INT"); p(f002.hash == f002.hash)
r003 = (f002.hash == f002.hash); p r003
