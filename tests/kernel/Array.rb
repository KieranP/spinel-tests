# frozen_string_literal: true
# Kernel#Array
p(Array(nil))
c001 = Array(nil); p(c001)
p(Array([1, 2]))
c002 = Array([1, 2]); p(c002)
p(Array(1))
c003 = Array(1); p(c003)
p(Array(1..3))
c004 = Array(1..3); p(c004)
c005h = { a: 1, b: 2 }
p(Array(c005h))
c005 = Array(c005h); p(c005)
p(Array("a"))
c006 = Array("a"); p(c006)
p(Array([]))
p(Array([nil]))
p(Array(:sym))
c007 = Array(1.5); p(c007)

# #to_a / #to_ary on a user object are not consulted — the object is just wrapped
class ToA008; def to_a; [1, 2]; end; end
p(Array(ToA008.new).size)
c008 = Array(ToA008.new) == [1, 2]; p c008
class ToAry009; def to_ary; [3, 4]; end; end
p(Array(ToAry009.new) == [3, 4])
c009 = Array(ToAry009.new).size; p c009
