# frozen_string_literal: true
# Random#==

r001 = Random.new(5)
r002 = Random.new(5)
r003 = Random.new(6)

# keep the file runnable
p(r001.rand(10).class)

# Random#== is true for two generators in the same state, false otherwise
p(r001 == r002)
p(r001 == r003)
p(r001 == r001)
x001 = (r001 == r002); p x001

# Random#equal? compares object identity
p(r001.equal?(r002))
p(r001.equal?(r001))

# two same-seed generators stay == after identical draws, and diverge after unequal draws
r010 = Random.new(7); r011 = Random.new(7)
r010.rand(100); r011.rand(100)
p(r010 == r011)
x010 = (r010 == r011); p x010

r012 = Random.new(7); r013 = Random.new(7)
r012.rand(100)
p(r012 == r013)

# Random === obj is Module case-equality: true for a Random instance, false otherwise
p(Random === Random.new(1))
p(Random === 5)
p(Random.new(1).is_a?(Random))
