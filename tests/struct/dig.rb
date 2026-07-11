# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#dig
Idx142 = Struct.new(:x, :y)
p(Idx142.new(10, 20).dig(:x))
v027 = Idx142.new(10, 20).dig(:x); p(v027)
In142 = Struct.new(:x); Ou142 = Struct.new(:pt); n142 = Ou142.new(In142.new(1)); p(n142.dig(:pt, :x))
In142b = Struct.new(:x); Ou142b = Struct.new(:pt); n142b = Ou142b.new(In142b.new(1)); v028 = n142b.dig(:pt, :x); p(v028)
# Integer keys, and a member holding a plain container
p(Idx142.new(10, 20).dig(1))
v029 = Idx142.new(10, 20).dig(0); p(v029)
Box143 = Struct.new(:items, :meta)
p(Box143.new([10, 20], { k: 5 }).dig(0, 1))
v030 = Box143.new([10, 20], { k: 5 }).dig(:meta, :k); p(v030)
# a Hash member whose values are Structs digs through correctly
Leaf144 = Struct.new(:v); Bag144 = Struct.new(:byname)
p(Bag144.new({ "k" => Leaf144.new(2) }).dig(:byname, "k"))
v031 = Bag144.new({ "k" => Leaf144.new(2) }).dig(:byname, "k"); p(v031)

# a key held in a local
S032 = Struct.new(:a, :b)
s032 = S032.new(1, 2); k032 = :a; p s032.dig(k032)
v032 = s032.dig(k032); p v032

# A key naming no member, and an index past the end, raise instead of answering
# nil; a String key aborts the C build. All three take the whole file down.
S033 = Struct.new(:a, :b)
p S033.new(1, 2).dig(:zz)
p S033.new(1, 2).dig(5)
S034 = Struct.new(:a, :b)
p S034.new(1, 2).dig("a")
v034 = S034.new(1, 2).dig("b"); p v034

# Digging through a member that holds an Array of Structs, and through a
# self-recursive Struct.
Leaf034 = Struct.new(:v); Box034 = Struct.new(:label, :items)
b034 = Box034.new("x", [Leaf034.new(2)])
p b034.dig(1, 0)
p b034.dig(:items, 0)
Node035 = Struct.new(:val, :kids)
t035 = Node035.new(1, [Node035.new(2, [])])
p t035.dig(1, 0)
p t035.dig(1, 0, 0)

# Two dig sites on ONE Struct whose member holds differently-typed collections
S037 = Struct.new(:a, :b)
p S037.new(1, [10, 20]).dig(1, 0)
p S037.new(1, { k: 5 }).dig(1, :k)
v037 = S037.new(1, [10, 20]).dig(1, 0); p v037

# An Array#dig chain that reaches a Struct: a String key aborts the C build, and
# a Symbol/Integer key raises TypeError instead of reading the member.
Leaf036 = Struct.new(:v)
a036 = [Leaf036.new(2)]
p a036.dig(0, "v")
Leaf037 = Struct.new(:v)
a037 = [Leaf037.new(2)]
r037 = (a037.dig(0, :v) rescue $!.class); p r037
r038 = (a037.dig(0, 0) rescue $!.class); p r038
