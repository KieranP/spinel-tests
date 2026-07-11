# frozen_string_literal: true
# Array#select
p([1, 2, 3, 4].select { |xa| xa.even? })

a001 = [1, 2, 3, 4]
p a001.class
p a001.select { |xa| xa.even? }

a002 = [1, 2, 3, 4]
c002 = a002.select { |xa| xa.even? }
p c002.class
p c002

p([1.1, 2.2, 3.3, 4.4].select { |xb| xb > 2.0 })

a003 = [1.1, 2.2, 3.3, 4.4]
p a003.class
p a003.select { |xb| xb > 2.0 }

a004 = [1.1, 2.2, 3.3, 4.4]
c004 = a004.select { |xb| xb > 2.0 }
p c004.class
p c004

p(["a", "bb", "ccc", "dddd"].select { |xc| xc.length > 2 })

a005 = ["a", "bb", "ccc", "dddd"]
p a005.class
p a005.select { |xc| xc.length > 2 }

a006 = ["a", "bb", "ccc", "dddd"]
c006 = a006.select { |xc| xc.length > 2 }
p c006.class
p c006

# no-block -> Enumerator; materialize deterministically via with_index
p([1, 2, 3].select.with_index { |xd, i| i.even? })

a007 = [1, 2, 3]
c007 = a007.select.with_index { |xd, i| i.even? }
p c007.class
p c007

# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p([1, 2, 3].select.class)

# block selects none -> []
p([1, 2, 3].select { |xe| xe > 9 })

a008 = [1, 2, 3]
c008 = a008.select { |xe| xe > 9 }
p c008

# block selects all
p([1, 2, 3].select { |xf| xf > 0 })

a009 = [1, 2, 3]
c009 = a009.select { |xf| xf > 0 }
p c009

# empty receiver -> []
p([].select { |xg| xg > 0 })

c010 = [].select { |xg| xg > 0 }
p c010

# Nil-guarding select{}.last inside an iteration block mistypes the result array.
zs20 = [[1, 2], [3, 4]]
zs21 = [0].map { |i| w = zs20.select { |a, _| a > 0 }.last; w ? w[0] : 9 }
p zs21
zs22 = [0, 1].map { |i| w = zs20.select { |a, _| a > 0 }.last; if w then w[0] else 9 end }
p zs22
# without the nil-guard the same chain is correct
p([0, 1].map { |i| zs20.select { |a, _| a > 0 }.last[0] })

# A user-defined #join or #pack whose receiver is the select block parameter
class Box616
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def join(other) = Box616.new(@value + other.value)

  def pack(other) = Box616.new(@value + other.value)
end
p([Box616.new(2)].select { |b616| b616.join(Box616.new(3)).value > 4 }.size)
w616 = [Box616.new(2)].select { |c616| c616.join(Box616.new(3)).value > 4 }.size; p w616
p([Box616.new(2)].select { |d616| d616.pack(Box616.new(3)).value > 4 }.size)
u616 = [Box616.new(2)].select { |e616| e616.pack(Box616.new(3)).value > 4 }.size; p u616
