# frozen_string_literal: true
# Hash#assoc
p({ "a" => 1 }.assoc("a"))
a006 = { "a" => 1 }; p(a006.assoc("a"))
a007 = { "a" => 1 }; b007 = "a"; p(a007.assoc(b007))
a008 = { "a" => 1 }; b008 = "a"; c008 = (a008.assoc(b008)); p c008
p({ "a" => 1 }.assoc("z"))
za901 = { "a" => 1 }.assoc("z"); p za901
p({ a: 1, b: 2 }.assoc(:b))
za902 = { a: 1, b: 2 }.assoc(:b); p za902
p({}.assoc("a"))
za903 = {}.assoc("a"); p za903

# On a Hash returned by a seedless Array#reduce.
a82as = { n: 1, s: { x: 2 } }
h82as = [a82as].reduce { |acc82as, l82as| acc82as }
r82as = (h82as.assoc(:n) rescue $!.class); p r82as
