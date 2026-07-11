# frozen_string_literal: true
# Float#__send__
p(3.5.__send__(:+, 1.0))
a001 = 3.5; p(a001.__send__(:round))
a002 = 3.5; b002 = 1.0; c002 = (a002.__send__(:+, b002)); p c002

p(3.5.__send__(:abs))
p((-2.5).__send__(:to_i))
a003 = 3.5; c003 = (a003.__send__(:floor)); p c003
