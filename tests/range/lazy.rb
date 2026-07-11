# frozen_string_literal: true
# Range#lazy
# bounded range: map / select / take_while / first(n) / to_a
p((1..10).lazy.map { |x| x * 2 }.to_a)
l001 = (1..10).lazy.map { |x| x * 2 }.to_a; p l001

p((1..10).lazy.select { |x| x.even? }.to_a)
l002 = (1..10).lazy.select { |x| x.even? }.to_a; p l002

p((1..10).lazy.take_while { |x| x < 5 }.to_a)
l003 = (1..10).lazy.take_while { |x| x < 5 }.to_a; p l003

p((1..10).lazy.first(3))
l004 = (1..10).lazy.first(3); p l004

p((1..10).lazy.map { |x| x * x }.first(4))
l005 = (1..10).lazy.map { |x| x * x }.first(4); p l005

# endless range: map then first(n) terminates
p((1..).lazy.map { |x| x * x }.first(5))
l006 = (1..).lazy.map { |x| x * x }.first(5); p l006

p((1..).lazy.select { |x| x % 3 == 0 }.first(4))
l007 = (1..).lazy.select { |x| x % 3 == 0 }.first(4); p l007
