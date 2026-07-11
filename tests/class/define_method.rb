# frozen_string_literal: true
class C001
  define_method(:hi) { 42 }
  [:a, :b].each { |m001| define_method(m001) { m001.to_s } }
end

# Class#define_method (declarative, in class body; literal and literal-array names)
o001 = C001.new
p(o001.hi)
v001 = o001.hi; p v001
p(o001.a)
v002 = o001.a; p v002
p(o001.b)
v003 = o001.b; p v003

# define_method with a block taking arguments, including an optional one
class C002
  define_method(:add) { |a002, b002| a002 + b002 }
  define_method(:inc) { |a003, b003 = 5| a003 + b003 }
end
p(C002.new.add(1, 2))
v004 = C002.new.add(3, 4); p v004
r002 = (C002.new.add(1) rescue $!.class); p r002
r003 = (C002.new.inc(1, 9) rescue $!.class); p r003
r004 = (C002.new.inc(1) rescue $!.class); p r004

# define_method with a Proc as the body (instead of a block) is rejected: the
# method is never defined, so calling it is a compile-time NoMethodError.
# class C003
#   P003 = ->(x) { x * 3 }
#   define_method(:fromproc, P003)
# end
# WONTFIX: See docs/limitations.md - "Fundamental limits — define_method with a runtime-computed name/body"
# p(C003.new.fromproc(2))
