# frozen_string_literal: true
# Random.new_seed

# Random.new_seed returns a fresh random Integer seed suitable for Random.new
p(Random.new_seed.class)
s001 = Random.new_seed; p(s001.class)
p(Random.new_seed.is_a?(Integer))
p(Random.new_seed >= 0)

# a fresh seed is usable to build a working generator (structural: draw stays in range)
s002 = Random.new_seed
p((0...10).include?(Random.new(s002).rand(10)))
p(Random.new(Random.new_seed).rand(10).class)
