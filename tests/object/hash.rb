# frozen_string_literal: true
class Obj195
end

# Object#hash
p(Obj195.new.hash.is_a?(Integer))
a022 = Obj195.new; p(a022.hash == a022.hash)
a024 = Obj195.new; v024 = (a024.hash == a024.hash); p v024
a023 = Obj195.new; v023 = (a023.hash.is_a?(Integer)); p v023
# distinct objects almost always hash differently; two reads of one object agree
a025 = Obj195.new; a026 = Obj195.new; p(a025.hash == a026.hash)
a027 = Obj195.new; v027 = (a027.hash == a027.hash); p v027
# hash is stable across a dup being a different object
a028 = Obj195.new; p(a028.hash == a028.dup.hash)
# a user object works as a Hash key by identity
h028 = {}; k028 = Obj195.new; h028[k028] = 42; p h028[k028]
h029 = {}; ka029 = Obj195.new; kb029 = Obj195.new; h029[ka029] = 1; h029[kb029] = 2; p h029.size

# a user class that overrides #hash and #eql? is looked up by value as a Hash key
class Money196
  attr_reader :c
  def initialize(c); @c = c; end
  def ==(o); o.is_a?(Money196) && c == o.c; end
  alias eql? ==
  def hash; c.hash; end
  def inspect; "M#{c}"; end
end
a030 = Money196.new(5); b030 = Money196.new(5); c030 = Money196.new(6)
p(a030.hash == b030.hash)
v030 = (a030.hash == b030.hash); p v030
p(a030.hash == c030.hash)
h030 = { a030 => "five" }
p(h030[b030])
v031 = h030[b030]; p v031
p(h030.key?(b030))
p(h030[c030])
h031 = {}; h031[a030] = 1; h031[b030] = 2; p h031.size
v032 = h031[Money196.new(5)]; p v032
p(h031.keys)
