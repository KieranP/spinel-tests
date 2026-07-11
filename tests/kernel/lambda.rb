# frozen_string_literal: true
# Kernel#lambda
la391 = lambda { |x| x * 2 }
p(la391.call(3))
p(la391.lambda?)
v391 = la391.call(4); p v391
la392 = (1..3).map { |base392| n392 = base392; -> { n392 } }
p(la392.map(&:call))
v392 = (1..3).map { |base393| n393 = base393; -> { n393 } }.map(&:call); p v392

f030 = ->(items) { items.each { |pr| out030 = pr.call; return out030 if out030 }; nil }
p f030.call([-> { "A" }])

def alt081(*parsers) = ->(s) { parsers.map { |pr| pr.call(s) } }
p alt081(*(0..2).map { |d| ->(s) { s } }).call("5")
