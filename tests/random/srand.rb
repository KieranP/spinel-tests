# frozen_string_literal: true
# Random.srand

# keep the file runnable
p(Random.rand(10).class)

# Random.srand seeds the default generator and returns the previous seed
srand(11); p(Random.srand(22))
p(Random.srand(5).class)
s001 = Random.srand(5); p(s001.class)

# Kernel#srand returns the previous seed as an Integer (deterministic when set explicitly)
srand(100); p(srand(200))
p(srand(7).class)
s002 = srand(3); p(s002.class)

# after reseeding the default generator, draws stay in range (structural, not the value)
srand(42)
p((0...10).include?(rand(10)))
