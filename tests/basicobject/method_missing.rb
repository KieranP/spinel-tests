# frozen_string_literal: true
class MM < BasicObject
  def initialize(x = 0)
    @x = x
  end
  # A user-defined method_missing is callable explicitly (Spinel warns at compile
  # time that it will not auto-dispatch, but the explicit call still runs).
  def method_missing(name, *args)
    @x + args.length
  end
end

# BasicObject#method_missing
# Explicit invocation of a user-defined method_missing works.
a001 = MM.new(10); p(a001.method_missing(:foo))
a002 = MM.new(10); v001 = (a002.method_missing(:foo)); p v001
a003 = MM.new(10); p(a003.method_missing(:foo, 1, 2, 3))
a004 = MM.new(10); v002 = (a004.method_missing(:bar, :a, :b)); p v002

# Automatic dispatch of an *undefined* method call to method_missing is a
# documented, deliberate limitation — Spinel resolves every call site statically,
# so an undefined call is rejected at compile time rather than routed here:
# WONTFIX: See docs/limitations.md - "Fundamental limits — method_missing"
# p(a001.no_such_method)
