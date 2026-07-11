# frozen_string_literal: true
# Interrupt#hash (Object#hash)
# hash is an Integer
p(Interrupt.new("m").hash.is_a?(Integer))
h001 = Interrupt.new("m").hash; p h001.is_a?(Integer)

# hash is stable for the same object
f002 = Interrupt.new("m"); p(f002.hash == f002.hash)
r003 = (f002.hash == f002.hash); p r003
