# frozen_string_literal: true
# KeyError#hash (Object#hash)
# hash is an Integer
p(KeyError.new("m").hash.is_a?(Integer))
h001 = KeyError.new("m").hash; p h001.is_a?(Integer)

# hash is stable for the same object
k002 = KeyError.new("m"); p(k002.hash == k002.hash)
r003 = (k002.hash == k002.hash); p r003
