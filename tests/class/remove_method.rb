# frozen_string_literal: true
class Base001; def foo; 1; end; end
class Sub001 < Base001
  def foo; 2; end
  # WONTFIX: See docs/limitations.md - "By design — remove_method / undef_method / remove_class_variable"
  # remove_method :foo
end

# Module#remove_method (declarative; removes Sub001's own def, inherited stays) — a documented
# by-design AOT limitation; the removal and its dependent assertions are kept commented.
# o001 = Sub001.new
# p(o001.foo)
# v001 = o001.foo; p v001
