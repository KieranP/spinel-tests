# frozen_string_literal: true
class Base001; def foo; 1; end; end
class Sub001 < Base001
  # WONTFIX: See docs/limitations.md - "By design — remove_method / undef_method / remove_class_variable"
  # undef_method :foo
end

# Module#undef_method (declarative, in class body) — a documented by-design AOT limitation;
# the removal and its dependent assertions are kept commented.
# o001 = Sub001.new
# r001 = (o001.foo rescue $!.class); p r001
# p(Sub001.method_defined?(:foo))
# v001 = Sub001.method_defined?(:foo); p v001
