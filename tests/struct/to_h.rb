# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)
Point = Struct.new(:x, :y)

# Struct#to_h
p(Point.new(1, 2).to_h)
h1 = Point.new(1, 2).to_h; p(h1)
# with block
p(Point.new(1, 2).to_h { |k, v| [k, v * 10] })
h2 = Point.new(1, 2).to_h { |k, v| [k, v * 10] }; p(h2)

r653 = ([Point.new(1, 2), Point.new(3, 4)].min_by { |p653| p653.x }.to_h rescue $!.class); p r653

# heterogeneous members captured through to_h
HetH = Struct.new(:i, :s, :arr)
p(HetH.new(1, "hi", [4, 5]).to_h)
vhh = HetH.new(1, "hi", [4, 5]).to_h; p(vhh)
# to_h with a block that rewrites keys and values
p(HetH.new(2, "y", [9]).to_h { |k, v| [k.to_s, v.inspect] })
vhb = HetH.new(2, "y", [9]).to_h { |k, v| [k.to_s, v.inspect] }; p(vhb)

# a Struct member holding another Struct is kept as-is in the hash
Inner654 = Struct.new(:v); Outer654 = Struct.new(:i, :n)
p(Outer654.new(Inner654.new(1), 2).to_h)
vo654 = Outer654.new(Inner654.new(1), 2).to_h; p(vo654)
# a keyword_init Struct round-trips through to_h and back
Kw655 = Struct.new(:a, :b, keyword_init: true)
p(Kw655.new(a: 1, b: 2).to_h)
h655 = Kw655.new(a: 1, b: 2).to_h; p(Kw655.new(**h655))
# the resulting Hash is an ordinary Hash
p(Point.new(1, 2).to_h.keys)
v656 = Point.new(1, 2).to_h.values; p(v656)
p(Point.new(1, 2).to_h.merge(z: 3))
v657 = Point.new(1, 2).to_h[:y]; p(v657)
# a block that returns String keys
p(Point.new(1, 2).to_h { |k, v| [k.to_s, v] })
v658 = Point.new(1, 2).to_h { |k, v| [v.to_s, v] }; p(v658)
# a block that swaps key and value emits ill-typed C
p(Point.new(1, 2).to_h { |k, v| [v, k] })
v659 = Point.new(1, 2).to_h { |k, v| [v, k] }; p(v659)
p(Point.new(1, 2).to_h { |k, v| [v * 10, k.to_s] })
# A block whose value is an Array or Hash literal is nil-filled. Runtime value
# difference, so these stay live.
p(Point.new(1, 2).to_h { |k, v| [k, [v]] })
v660 = Point.new(1, 2).to_h { |k, v| [k, [v]] }; p(v660)
p(Point.new(1, 2).to_h { |k, v| [k, { m: v }] })
v661 = Point.new(1, 2).to_h { |k, v| [k, { m: v }] }; p(v661)

# and feeding the result back through reduce leaves a reference to _sp_PolyPolyHash_update,
# which is never emitted. Kept commented: the link fails and takes the whole file down.
SM950 = Struct.new(:o, :b, :st, keyword_init: true)
def bump950(s) = s.class.new(**s.to_h.merge(b: s.b + 1))
def rep950(es, from) = es.reduce(from) { |st, _e| bump950(st) }
p rep950([1], SM950.new(o: "a", b: 0, st: :open)).to_h
v951 = rep950([1], SM950.new(o: "a", b: 0, st: :open)).to_h; p v951
