# frozen_string_literal: true
# String#count
p("aabbbc".count("b"))
a037 = "aabbbc"; p(a037.count("b"))
a038 = "aabbbc"; b038 = "b"; p(a038.count(b038))
a039 = "aabbbc"; b039 = "b"; c039 = (a039.count(b039)); p c039
# counts by character on a multibyte receiver
p("café éé".count("é"))
p("a☕b☕c".count("☕"))
a043 = "café éé"; c043 = (a043.count("é")); p c043
# character ranges and negation
p("hello world".count("a-z"))
p("hello world".count("^l"))
p("hello".count("lo"))
# intersection of two selectors
p("hello".count("l-o", "o"))

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ct(oct)
  case oct
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_ct = (raisebr_ct("ab").count("s") rescue $!.class); p rb_ct

# On a String returned by Fiber#resume.
f81count = Fiber.new { Fiber.yield('aabbcc'); nil }
w81count = f81count.resume
r81count = (w81count.count("a") rescue $!.class); p r81count

# a splatted argument list held in a variable
sc160 = ["l"]
p("hello".count(*sc160))
vc160 = "hello".count(*sc160); p vc160
# control: the same argument positionally, and a literal array splatted in place
p("hello".count("l"))
p("hello".count(*["l"]))
p("a-b".count("a\\-b"))
v_eh = ("a-b".count("a\\-b")); p v_eh
# negation, ranges, and the intersection of three selectors
p("hello world".count("^aeiou"))
p("hello world".count("a-y", "^l"))
v_ms = ("hello world".count("a-y", "^l")); p v_ms
p("hello".count(""))
