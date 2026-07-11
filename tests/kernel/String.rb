# frozen_string_literal: true
# Kernel#String
p(String(:sym))
c028 = String(:sym); p(c028)
p(String([1, 2]))
c029 = String([1, 2]); p(c029)

# String() over the other builtins, and over a user #to_s
p(String(1))
c030 = String(1); p(c030)
p(String(nil))
p(String(1.5))
p(String(true))
c031 = String({ a: 1 }); p(c031)
class ToS032; def to_s; "c1"; end; end
p(String(ToS032.new))
c032 = String(ToS032.new); p(c032)

# a #to_str object is not consulted — String() falls back to the default #to_s
class ToStr033; def to_str; "c2str"; end; end
p(String(ToStr033.new) == "c2str")
c033 = String(ToStr033.new) == "c2str"; p c033
