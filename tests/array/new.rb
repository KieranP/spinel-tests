# frozen_string_literal: true
# Array.new

p Array.new(2, [])
n001 = Array.new(2, [])
p n001

p Array.new(2, {})
n002 = Array.new(2, {})
p n002

# non-empty fill objects work fine:
p Array.new(2, [1, 2])
n003 = Array.new(2, [1, 2])
p n003

p Array.new(2, "x")
n004 = Array.new(2, "x")
p n004

p Array.new(2, 7)
n005 = Array.new(2, 7)
p n005

# 1-arg size only -> nil-filled
p Array.new(3)
n006 = Array.new(3)
p n006

# no-arg -> []
p Array.new
n007 = Array.new
p n007

# block form
p Array.new(3) { |i| i * 2 }
n008 = Array.new(3) { |i| i * 2 }
p n008

# zero size -> []
p Array.new(0)
n009 = Array.new(0)
p n009

# block form yields a distinct object per slot (unlike the shared-reference 2-arg form)
n010 = Array.new(2) { [] }
n010[0] << 1
p n010

def setit613(arr613, i613); arr613[i613] = 99; end
n613a = Array.new(4) { |i| i }; setit613(n613a, 1); p n613a
n613b = Array.new(4) { |i| i }; setit613(n613b, 2); p n613b

# the argument-less constructor
h021 = Array.new; p h021
h022 = Array.new; p h022.size
h023 = Array.new; p h023.empty?
h024 = Array.new; p h024.shift
h025 = Array.new; p h025.pop
h026 = Array.new; p h026.frozen?
h027 = Array.new; h027 << 1; p h027
p Array.new.inspect
p Array.new(0).shift(2)
p Array.new(0).pop(2)
w021 = Array.new(0); p w021.shift(2)
p Array.new.frozen?
p Array.new.class
p Array.new.size
h028 = Array.new; p h028.shift(2)
h029 = Array.new; p h029.pop(2)

# the sized and block constructors
p Array.new(3)
p Array.new(3, 0)
p Array.new(3) { |i030| i030 * i030 }
w030 = Array.new(3) { |i031| i031 }; p w030
p Array.new(2) { [] }
p Array.new([1, 2].size, "x")
w031 = (Array.new(-1) rescue $!.class); p w031
