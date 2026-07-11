# frozen_string_literal: true
# Kernel#loop as an expression
r129 = loop { break }; p r129

rlp = (loop.with_index.find { |_, i| break i if i == 3 } rescue $!.class); p rlp

# loop inside a lambda body: the lambda returns the loop's value, not its final expression
g046 = ->() { loop { break }; 42 }
p(g046.call)
v046 = g046.call; p v046

# loop's value: `break VALUE`, and the exhausted enumerator's StopIteration#result
i130 = 0
r130 = loop { i130 += 1; break i130 * 2 if i130 == 3 }; p r130
p(loop { break :bv })
e131 = [1, 2].each
loop { p e131.next }
e132 = [1, 2].each
r132 = loop { e132.next }; p r132

# `next` inside loop, and an explicit StopIteration ends it quietly
i133 = 0
loop do
  i133 += 1
  next if i133 < 3
  break
end
p i133
r134 = loop { raise StopIteration }; p r134
