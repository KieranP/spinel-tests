# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#deconstruct
p(Nums.new(3, 1, 2).deconstruct)
d1 = Nums.new(3, 1, 2).deconstruct; p(d1)

As859 = Struct.new(:x); Bs859 = Struct.new(:y)
def ev859(node); case node; in As859[x] then x; in Bs859[y] then y; end; end
r859a = (ev859(As859.new(5)) rescue $!.class); p r859a
r859b = (ev859(Bs859.new(9)) rescue $!.class); p r859b

# a bare array pattern on the Struct itself, and multiple assignment from
# #deconstruct
Pt860 = Struct.new(:a, :b)
r860 = (case Pt860.new(1, 2); in [x860, y860] then [x860, y860]; end); p r860
m860, n860 = Pt860.new(3, 4).deconstruct; p([m860, n860])
# a class-name array pattern with a literal element and a bound one
r861 = (case Pt860.new(7, 8); in Pt860[7, Integer => q861] then q861; end); p r861
# a non-matching class pattern raises NoMatchingPatternError
r862 = (begin; case Pt860.new(7, 8); in Pt860[999, *] then :matched; end; rescue NoMatchingPatternError; :nomatch; end); p r862

# An array sub-pattern nested inside an array pattern never destructures a
# Struct element. Runtime error, so these stay live.
arr863 = [Pt860.new(1, 2)]
r863 = (case arr863; in [Pt860[x863, y863]] then [x863, y863]; end rescue $!.class); p r863
r864 = (case arr863; in [[x864, y864]] then [x864, y864]; end rescue $!.class); p r864
arr865 = [Pt860.new(1, 2), Pt860.new(3, 4)]
r865 = (case arr865; in [*, Pt860[x865, 4], *] then x865; end rescue $!.class); p r865
h866 = { k: Pt860.new(5, 6) }
r866 = (case h866; in { k: Pt860[x866, y866] } then [x866, y866]; end rescue $!.class); p r866
# the same nestings with a HASH sub-pattern, or a binding pattern, all match
r867 = (case arr863; in [Pt860(a: x867, b: y867)] then [x867, y867]; end rescue $!.class); p r867
r868 = (case arr863; in [Pt860 => e868] then e868.a; end rescue $!.class); p r868
r869 = (case h866; in { k: Pt860(a: x869, b: y869) } then [x869, y869]; end rescue $!.class); p r869
# so this form stays commented; case/in on the same value is exercised above
StOl135 = Struct.new(:kind, :n)
r135 = (StOl135.new(:binop, 1) in { kind: :binop }); p r135
v136 = (StOl135.new(:binop, 1) in { kind: :binop }); p v136
