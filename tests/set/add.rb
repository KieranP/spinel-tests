# frozen_string_literal: true
require 'set'

# Set#add
p(Set[1, 2].add(3).to_a.sort)
a305 = Set[1, 2]; a305.add(3); p(a305.to_a.sort)
a306 = Set[1, 2]; b306 = 3; a306.add(b306); p(a306.to_a.sort)
c307 = Set[1, 2]; d307 = (c307.add(3)); p(d307.to_a.sort)

# adding an already-present element is a no-op
e307 = Set[1, 2]; e307.add(2); p(e307.to_a.sort)

# String elements
f307 = Set["a", "b"]; f307.add("c"); p(f307.to_a.sort)
g307 = Set["a"]; h307 = (g307.add("b")); p(h307.to_a.sort)

# Symbol elements
i307 = Set[:a, :b]; j307 = :c; i307.add(j307); p(i307.to_a.sort)

# Adding to a dup of a Set also adds to the original.
a045 = Set[1, 2]; b045 = a045.dup; b045.add(3); p(a045.to_a.sort)
a046 = Set[1, 2]; b046 = a046.dup; b046.add(3); v046 = a046.to_a.sort; p v046

# extra arguments
r097 = (Set[1, 2].add(1, 2) rescue $!.class); p r097
s097 = Set[1, 2]; t097 = (s097.add(3, 4) rescue $!.class); p t097

# a user object with custom ==/eql?/hash
class Cell096
  attr_reader :v
  def initialize(v); @v = v; end
  def ==(o); o.is_a?(Cell096) && o.v == @v; end
  def eql?(o); self == o; end
  def hash; @v.hash; end
end
u096 = Set[Cell096.new(1)]; u096.add(Cell096.new(1)); p(u096.size)
v096 = Set[Cell096.new(1)]; w096 = v096.add(Cell096.new(2)); p(w096.size)

# Array, Hash and nested-Set elements
x096 = Set[[1, 2]]; x096.add([1, 2]); x096.add([3]); p(x096.size)
y096 = Set[{ a: 1 }]; z096 = y096.add({ a: 1 }); p(z096.size)
a096 = Set[Set[1]]; a096.add(Set[1]); p(a096.size)
