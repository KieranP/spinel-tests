# frozen_string_literal: true
# Float#send
p(3.5.send(:+, 1.0))
a001 = 3.5; p(a001.send(:+, 1.0))
a002 = 3.5; b002 = 1.0; c002 = (a002.send(:+, b002)); p c002

# no-arg and predicate methods dispatched by symbol
p(3.5.send(:round))
p(3.5.send(:abs))
p((-2.5).send(:negative?))
p(3.5.send(:to_i))
a003 = 3.5; c003 = (a003.send(:ceil)); p c003
