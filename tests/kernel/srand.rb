# frozen_string_literal: true
# Kernel#srand

# srand returns an Integer (the previous seed)
p(srand(5).class)
a001 = srand(5); p(a001.class)
srand(9); p(srand.class)

# srand(n) returns the previous seed
srand(100); p(srand(200))
srand(7); srand(50); p(srand(999))
srand(11); a002 = srand(22); p a002

# the very first srand's return is the auto-initial seed (Ruby-nondeterministic), so
# probe only its type
p(srand(1).class)
