# frozen_string_literal: true
# SystemExit#hash (Object#hash)
# hash is an Integer
p(SystemExit.new(2).hash.is_a?(Integer))
h001 = SystemExit.new(2).hash; p h001.is_a?(Integer)

# hash is stable for the same object
k002 = SystemExit.new(2); p(k002.hash == k002.hash)
r003 = (k002.hash == k002.hash); p r003
