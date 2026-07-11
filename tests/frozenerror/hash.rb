# frozen_string_literal: true
# FrozenError#hash (Object#hash)
# hash is an Integer
p(FrozenError.new("m").hash.is_a?(Integer))
h001 = FrozenError.new("m").hash; p h001.is_a?(Integer)

# hash is stable for the same object
f002 = FrozenError.new("m"); p(f002.hash == f002.hash)
r003 = (f002.hash == f002.hash); p r003
